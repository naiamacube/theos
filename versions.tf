terraform {
  cloud {
    organization = "naiama"
    hostname     = "app.terraform.io"

    workspaces {
      name = "n3-theos"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.44.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.44.1"
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
  zone        = var.gcp_zone
}

module "phanes" {
  source              = "./modules/phanes"

  pgp_key             = var.pgp_key
  aws_region          = var.aws_region
  aws_access_key      = var.aws_access_key_id
  aws_secret_key      = var.aws_secret_access_key
  gcp_zone            = var.gcp_zone
  gcp_organization_id = var.gcp_organization_id
  gcp_credentials     = var.gcp_credentials
}

module "thalassa" {
  source          = "./modules/thalassa"

  pgp_key         = var.pgp_key
  tfe_hostname    = var.tfe_hostname
  tfe_token       = var.tfe_token
  aws_region      = var.aws_region
  aws_access_key  = var.aws_access_key_id
  aws_secret_key  = var.aws_secret_access_key
}

module "zeus" {
  source              = "./modules/zeus"

  pgp_key             = var.pgp_key
  aws_region          = var.aws_region
  aws_access_key      = var.aws_access_key_id
  aws_secret_key      = var.aws_secret_access_key
  gcp_zone            = var.gcp_zone
  gcp_organization_id = var.gcp_organization_id
  gcp_credentials     = var.gcp_credentials
  gcp_billing_id      = var.gcp_billing_id
}
