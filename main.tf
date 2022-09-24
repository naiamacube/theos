terraform {
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
  // TODO: switch to token, by configuring an AWS Identity Provider
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

provider "google" {
  // TODO: switch to access_token w/ circle-ci orb google-cloud-cli
  credentials = file(var.gcp_credentials)
}
