terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.30.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.33.0"
    }
  }

  required_version = "> 1.2.8"
}

provider "azuread" {
  client_id     = var.azure_client_id
  client_secret = var.azure_client_secret
  tenant_id     = var.azure_tenant_id
}

provider "azurerm" {
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
  features { }
}
