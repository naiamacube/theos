terraform {
  cloud {
    organization = "naiama"
    hostname = "app.terraform.io"

    workspaces {
      name = "theos"
    }
  }
}

module "dokimi" {
  source = "./modules/dokimi"

  aws_access_key = var.aws_access_key_id
  aws_secret_key = var.aws_secret_access_key
  aws_region = var.dokimi_aws_region
  aws_backend = var.dokimi_aws_backend

  gcp_credentials = file(var.gcp_credentials)
  gcp_region = var.dokimi_gcp_region
}
