locals {
  service_principal_name = "n3ladon"
  resource_group_name    = "naiamacube"
}

data "azuread_client_config" "main" { }

resource "azuread_application" "main" {
  display_name = "${local.service_principal_name}tf"
}

resource "azuread_application_certificate" "main" {
  application_object_id = azuread_application.main.id
  encoding              = "base64"
  type                  = "AsymmetricX509Cert"
  value                 = var.azure_client_certificate_base64
}

data "azurerm_subscription" "main" { }

resource "azurerm_role_assignment" "storage-blob-data-owner" {
  scope                = data.azurerm_subscription.main.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azuread_application.main.id
}

resource "azurerm_role_assignment" "resource-manager-reader" {
  scope                = data.azurerm_subscription.main.id
  role_definition_name = "Reader"
  principal_id         = azuread_application.main.id
}

data "azurerm_resource_group" "main" {
  name = local.resource_group_name
}

resource "azurerm_storage_account" "main" {
  name                              = local.service_principal_name
  resource_group_name               = local.resource_group_name
  location                          = data.azurerm_resource_group.main.location
  account_tier                      = "Standard"
  account_replication_type          = "GRS"
  infrastructure_encryption_enabled = true

  blob_properties {
    versioning_enabled  = true
    change_feed_enabled = true
  }
}

resource "azurerm_storage_container" "main" {
  name                  = "${local.service_principal_name}-tfstate"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}
