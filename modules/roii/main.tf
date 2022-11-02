locals {
  aws_region = "eu-west-3"
  gcp_region = "europe-west9-a"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
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
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  region = local.aws_region
}

provider "google" {
  credentials = var.gcp_credentials

  region      = local.gcp_region
}
