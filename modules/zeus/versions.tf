terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
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
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

provider "google" {
  project     = "n3-zeus"
  credentials = var.gcp_credentials
  zone        = var.gcp_zone
}
