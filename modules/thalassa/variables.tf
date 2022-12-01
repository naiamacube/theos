variable "tfe_hostname" {
  description = "Terraform Cloud Hostname"
  type        = string
  sensitive   = true
}

# Generate a token w/ necessary permissions in Terraform Cloud

variable "tfe_token" {
  description = "Terraform Cloud Token"
  type        = string
  sensitive   = true
}

# To generate a new key-pair, install GnuPG (https://www.gnupg.org/download/) then refer to the GitHub guide (https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

variable "pgp_key" {
  description = "PGP Public Key"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  sensitive   = true
}

# Requires the creation of an AWS root account, and an IAM user w/ full access to the platform

variable "aws_access_key" {
  description = "AWS IAM User Access Key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS IAM User Secret Access Key"
  type        = string
  sensitive   = true
}
