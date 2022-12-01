terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.44.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.38.0"
    }
  }
  required_version = "> 1.2.8"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

provider "tfe" {
  hostname = var.tfe_hostname
  token    = var.tfe_token
}
