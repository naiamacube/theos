output "phanes-backend-storage-arn" {
  value = module.phanes.aws-storage-arn
  sensitive = true
}

output "phanes-backend-locking-arn" {
  value = module.phanes.aws-locking-arn
  sensitive = true
}

output "phanes-backend-iam-tf-key" {
  value = module.phanes.aws-iam-tf-key
  sensitive = true
}

output "phanes-backend-iam-tf-secret" {
  value = module.phanes.aws-iam-tf-secret
  sensitive = true
}

output "phanes-gcp-tf-email" {
  value = module.phanes.gcp-tf-email
  sensitive = true
}

output "phanes-gcp-tf-publickey" {
  value = module.phanes.gcp-tf-publickey
  sensitive = true
}

output "phanes-gcp-tf-privatekey" {
  value = module.phanes.gcp-tf-privatekey
  sensitive = true
}

output "thalassa-aws-iam-user-arn" {
  value = module.thalassa.aws-iam-user-arn
  sensitive = true
}

output "thalassa-aws-iam-user-name" {
  value = module.thalassa.aws-iam-user-name
  sensitive = true
}

output "thalassa-aws-iam-user-unique-id" {
  value = module.thalassa.aws-iam-user-unique-id
  sensitive = true
}   

output "thalassa-aws-iam-access-key-id" {
  value = module.thalassa.aws-iam-access-key-id
  sensitive = true
}

output "thalassa-aws-iam-access-key-encrypted-secret" {
  value = module.thalassa.aws-iam-access-key-encrypted-secret
  sensitive = true
}

output "zeus-backend-storage-arn" {
  value = module.zeus.aws-storage-arn
  sensitive = true
}

output "zeus-backend-locking-arn" {
  value = module.zeus.aws-locking-arn
  sensitive = true
}

output "zeus-aws-iam-user-arn" {
  value = module.zeus.aws-iam-user-arn
  sensitive = true
}

output "zeus-aws-iam-user-name" {
  value = module.zeus.aws-iam-user-name
  sensitive = true
}

output "zeus-aws-iam-user-unique-id" {
  value = module.zeus.aws-iam-user-unique-id
  sensitive = true
}   

output "zeus-aws-iam-access-key-id" {
  value = module.thalassa.aws-iam-access-key-id
  sensitive = true
}

output "zeus-aws-iam-access-key-encrypted-secret" {
  value = module.thalassa.aws-iam-access-key-encrypted-secret
  sensitive = true
}

output "ladon-azuread-service-principal-application-id" {
  value = module.ladon.azuread-service-principal-application-id
  sensitive = true
}

output "ladon-azuread-service-principal-object-id" {
  value = module.ladon.azuread-service-principal-object-id
  sensitive = true
}

output "ladon-azurerm-storage-account-id" {
  value = module.ladon.azurerm-storage-account-id
  sensitive = true
}

output "ladon-azurerm-storage-account-primary-location" {
  value = module.ladon.azurerm-storage-account-primary-location
  sensitive = true
}

output "ladon-azurerm-storage-account-primary-blob-endpoint" {
  value = module.ladon.azurerm-storage-account-primary-blob-endpoint
  sensitive = true
}

output "ladon-azurerm-storage-account-primary-table-endpoint" {
  value = module.ladon.azurerm-storage-account-primary-table-endpoint
  sensitive = true
}

output "ladon-azurerm-storage-container-id" {
  value = module.ladon.azurerm-storage-container-id
  sensitive = true
}

output "ladon-azurerm-storage-container-resource-manager-id" {
  value = module.ladon.azurerm-storage-container-resource-manager-id
  sensitive = true
}
