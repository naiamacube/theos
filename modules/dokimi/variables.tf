variable "domain" {
  description = "Organization domain"
  type        = string
}

variable "subspace" {
  description = "Organization Subspace"
  type        = string
}

# To generate a new key-pair, install GnuPG (https://www.gnupg.org/download/) then refer to the GitHub guide (https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

variable "pgp_key" {
  description = "PGP Public Key"
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

# Requires the creation of a GCP organization, and a service-account with full access to the platform, including project creation rights

variable "gcp_credentials" {
  description = "GCP SA Private Key"
  type        = string
  sensitive   = true
}
