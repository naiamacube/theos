output "dokimi-backend-storage-arn" {
  value = module.dokimi.backend-storage-arn
  sensitive = true
}

output "dokimi-backend-locking-arn" {
  value = module.dokimi.backend-locking-arn
  sensitive = true
}

output "dokimi-iam-tf-key" {
  value = module.dokimi.iam-tf-key
  sensitive = true
}

output "dokimi-iam-tf-secret" {
  value = module.dokimi.iam-tf-secret
  sensitive = true
}
