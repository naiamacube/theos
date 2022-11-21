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

module "efkolo" {
  source          = "./modules/efkolo"

  domain          = var.domain
  subspace        = var.subspace
  pgp_key         = var.pgp_key

  aws_access_key  = var.aws_access_key_id
  aws_secret_key  = var.aws_secret_access_key

  gcp_credentials = var.gcp_credentials
}

module "alisida" {
  source          = "./modules/alisida"

  organization    = var.organization
  pgp_key         = var.pgp_key

  tfe_hostname    = var.tfe_hostname
  tfe_token       = var.tfe_token

  aws_access_key  = var.aws_access_key_id
  aws_secret_key  = var.aws_secret_access_key
}

module "hades" {
  source          = "./modules/hades"

  domain          = var.domain
  subspace        = var.subspace
  pgp_key         = var.pgp_key

  aws_access_key  = var.aws_access_key_id
  aws_secret_key  = var.aws_secret_access_key

  gcp_credentials = var.gcp_credentials
  gcp_billing_id  = var.gcp_billing_id

  circleci_org_id = var.circleci_org_id
  circleci_token  = var.circleci_token
}
