output "dokimi-backend-storage-arn" {
  value = module.dokimi.aws-storage-arn
  sensitive = true
}

output "dokimi-backend-locking-arn" {
  value = module.dokimi.aws-locking-arn
  sensitive = true
}

output "dokimi-backend-iam-tf-key" {
  value = module.dokimi.aws-iam-tf-key
  sensitive = true
}

output "dokimi-backend-iam-tf-secret" {
  value = module.dokimi.aws-iam-tf-secret
  sensitive = true
}

output "dokimi-gcp-tf-email" {
  value = module.dokimi.gcp-tf-email
  sensitive = true
}

output "dokimi-gcp-tf-publickey" {
  value = module.dokimi.gcp-tf-publickey
  sensitive = true
}

output "dokimi-gcp-tf-privatekey" {
  value = module.dokimi.gcp-tf-privatekey
  sensitive = true
}

output "alisida-aws-iam-user-arn" {
  value = module.alisida.aws-iam-user-arn
  sensitive = true
}

output "alisida-aws-iam-user-name" {
  value = module.alisida.aws-iam-user-name
  sensitive = true
}

output "alisida-aws-iam-user-unique-id" {
  value = module.alisida.aws-iam-user-unique-id
  sensitive = true
}   

output "alisida-aws-iam-access-key-id" {
  value = module.alisida.aws-iam-access-key-id
  sensitive = true
}

output "alisida-aws-iam-access-key-encrypted-secret" {
  value = module.alisida.aws-iam-access-key-encrypted-secret
  sensitive = true
}
