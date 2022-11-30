output "azuread-service-principal-application-id" {
  value = azuread_application.main.application_id
  sensitive = true
}

output "azuread-service-principal-object-id" {
  value = azuread_application.main.object_id
  sensitive = true
}

output "azurerm-storage-account-id" {
  value = azurerm_storage_account.main.id
  sensitive = true
}

output "azurerm-storage-account-primary-location" {
  value = azurerm_storage_account.main.primary_location
  sensitive = true
}

output "azurerm-storage-account-primary-blob-endpoint" {
  value = azurerm_storage_account.main.primary_blob_endpoint
  sensitive = true
}

output "azurerm-storage-account-primary-table-endpoint" {
  value = azurerm_storage_account.main.primary_table_endpoint
  sensitive = true
}

output "azurerm-storage-container-id" {
  value = azurerm_storage_container.main.id
  sensitive = true
}

output "azurerm-storage-container-resource-manager-id" {
  value = azurerm_storage_container.main.resource_manager_id
  sensitive = true
}
