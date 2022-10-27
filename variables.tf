variable "aws_access_key_id" {
  description = "AWS IAM User Access Key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS IAM User Secret Access Key"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  sensitive   = true
}

variable "gcp_credentials" {
  description = "GCP SA Private Key"
  type        = string
  sensitive   = true
}

variable "gcp_region" {
  description = "GCP Region"
  type        = string
  sensitive   = true
}

variable "dokimi_aws_region" {
  description = "Dokimi AWS Region"
  type        = string
  sensitive   = true
}

variable "dokimi_aws_backend" {
  description = "Dokimi AWS Backend name"
  type        = string
  sensitive   = true
}

variable "dokimi_aws_iam" {
  description = "Dokimi AWS IAM name"
  type        = string
  sensitive   = true
}

variable "dokimi_gcp_region" {
  description = "Dokimi GCP Region"
  type        = string
  sensitive   = true
}
