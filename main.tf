terraform {
  cloud {
    organization = var.organization
    hostname     = "app.terraform.io"

    workspaces {
      name = "theos"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.37.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.41.0"
    }
  }

  required_version = "> 1.2.8"
}

provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region     = var.aws_region
}

provider "google" {
  credentials = var.gcp_credentials
  region      = var.gcp_region
}

module "dokimi" {
  source          = "./modules/dokimi"

  domain          = var.domain
  subspace        = var.subspace
  pgp_key         = var.pgp_key

  aws_access_key  = var.aws_access_key_id
  aws_secret_key  = var.aws_secret_access_key

  gcp_credentials = var.gcp_credentials
}

module "dokimi" {
  source          = "./modules/alisida"

  domain          = var.domain
  subspace        = var.subspace
  pgp_key         = var.pgp_key

  aws_access_key  = var.aws_access_key_id
  aws_secret_key  = var.aws_secret_access_key
}
