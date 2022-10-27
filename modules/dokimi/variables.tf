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

variable "aws_region" {
  description = "AWS Region"
  type        = string
  sensitive   = true
}

variable "aws_backend" {
  description = "AWS Backend generic name"
  type        = string
  sensitive   = true
}

variable "aws_iam" {
  description = "AWS IAM name"
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
