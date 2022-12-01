variable "pgp_key" {
  description = "PGP Public Key"
  type        = string
  sensitive   = true
}

variable "tfe_hostname" {
  description = "Terraform Cloud Hostname"
  type        = string
  sensitive   = true
}

variable "tfe_token" {
  description = "Terraform Cloud Token"
  type        = string
  sensitive   = true
}

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

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "azure_client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
  sensitive   = true
}

variable "azure_client_secret" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "azure_client_certificate_base64" {
  description = "Azure Service Principal Client Certificate, Base64-encoded"
  type        = string
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "gcp_credentials" {
  description = "GCP SA Private Key"
  type        = string
  sensitive   = true
}

variable "gcp_organization_id" {
  description = "GCP Organization ID"
  type        = string
  sensitive   = true
}

variable "gcp_billing_id" {
  description = "GCP Billing ID"
  type        = string
  sensitive   = true
}

variable "gcp_region" {
  description = "GCP Region"
  type        = string
  sensitive   = true
}

variable "gcp_zone" {
  description = "GCP Zone"
  type        = string
  sensitive   = true
}

variable "circleci_org_id" {
  description = "CircleCI Organization UUID"
  type        = string
  sensitive   = true
}

variable "circleci_token" {
  description = "CircleCI User Token"
  type        = string
  sensitive   = true
}
