terraform {
  cloud {
    organization = "naiama"
    hostname     = "app.terraform.io"

    workspaces {
      name = "n3-theos"
    }
  }
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.2.3"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.37.0"
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
  region      = var.gcp_region
}

module "phanes" {
  source          = "./modules/phanes"

  domain          = var.domain
  subspace        = var.subspace
  pgp_key         = var.pgp_key

  aws_access_key  = var.aws_access_key_id
  aws_secret_key  = var.aws_secret_access_key

  gcp_credentials = var.gcp_credentials
}

module "thalassa" {
  source          = "./modules/thalassa"

  organization    = var.organization
  pgp_key         = var.pgp_key

  tfe_hostname    = var.tfe_hostname
  tfe_token       = var.tfe_token

  aws_access_key  = var.aws_access_key_id
  aws_secret_key  = var.aws_secret_access_key
}

module "zeus" {
  source          = "./modules/zeus"

  domain          = var.domain
  subspace        = var.subspace
  pgp_key         = var.pgp_key

  aws_access_key  = var.aws_access_key_id
  aws_secret_key  = var.aws_secret_access_key

  gcp_credentials = var.gcp_credentials
  gcp_billing_id  = var.gcp_billing_id
}

module "ladon" {
  source                            = "./modules/ladon"

  domain                            = var.domain
  subspace                          = var.subspace
  pgp_key                           = var.pgp_key

  azure_subscription_id           = var.azure_subscription_id
  azure_client_id                 = var.azure_client_id
  azure_client_secret             = var.azure_client_secret
  # TODO: generate directly from provider:tls
  azure_client_certificate_base64 = var.azure_client_certificate_base64
  azure_tenant_id                 = var.azure_tenant_id
}
