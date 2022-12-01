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
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.30.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.33.0"
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

provider "azuread" {
  client_id     = var.azure_client_id
  client_secret = var.azure_client_secret
  tenant_id     = var.azure_tenant_id
}

provider "azurerm" {
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
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
