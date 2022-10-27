terraform {
  cloud {
    organization = "naiama"
    hostname = "app.terraform.io"

    workspaces {
      name = "theos"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.32.0"
    }
    google = {
      source = "hashicorp/google"
      version = "4.37.0"
    }
  }

  required_version = "> 1.2.8"
}

provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region = var.aws_region
}

provider "google" {
  credentials = var.gcp_credentials
  region = var.gcp_region
}

module "dokimi" {
  source = "./modules/dokimi"

  aws_access_key = var.aws_access_key_id
  aws_secret_key = var.aws_secret_access_key
  aws_region = var.dokimi_aws_region
  aws_backend = var.dokimi_aws_backend

  gcp_credentials = var.gcp_credentials
  gcp_region = var.dokimi_gcp_region
}
