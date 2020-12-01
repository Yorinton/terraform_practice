locals {
  # 親ディレクトリ内のbackend-config.yamlのファイル内容をデコードしてimport
  backend-config = yamldecode(file("./backend-config.yaml"))
}

remote_state {
  backend = "s3"
  config = {
    bucket = local.backend-config.bucket
    key = "${path_relative_to_include()}.tfstate"
    region = local.backend-config.region
    encrypt = local.backend-config.encrypt
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
    terraform {
      backend "s3" {}
    }
  EOF
}