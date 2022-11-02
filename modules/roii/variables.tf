variable "domain" {
  description = "Organization domain"
  type        = string
}

variable "subspace" {
  description = "Organization subspace"
  type        = string
}

# To generate a new key-pair, install GnuPG (https://www.gnupg.org/download/) then refer to the GitHub guide (https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

variable "pgp_key" {
  description = "PGP Public Key"
  type        = string
  sensitive   = true
}

# Requires the creation of an AWS root account, and an IAM user w/ full access to the platform

variable "access_key" {
  description = "AWS IAM User Access Key ID"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS IAM User Secret Access Key"
  type        = string
  sensitive   = true
}

variable "credentials" {
  description = "GCP SA credentials"
  type        = string
  sensitive   = true
}
