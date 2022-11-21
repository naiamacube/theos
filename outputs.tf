output "artemis-backend-storage-arn" {
  value = module.artemis.aws-storage-arn
  sensitive = true
}

output "artemis-backend-locking-arn" {
  value = module.artemis.aws-locking-arn
  sensitive = true
}

output "artemis-backend-iam-tf-key" {
  value = module.artemis.aws-iam-tf-key
  sensitive = true
}

output "artemis-backend-iam-tf-secret" {
  value = module.artemis.aws-iam-tf-secret
  sensitive = true
}

output "artemis-gcp-tf-email" {
  value = module.artemis.gcp-tf-email
  sensitive = true
}

output "artemis-gcp-tf-publickey" {
  value = module.artemis.gcp-tf-publickey
  sensitive = true
}

output "artemis-gcp-tf-privatekey" {
  value = module.artemis.gcp-tf-privatekey
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

output "hades-backend-storage-arn" {
  value = module.hades.aws-storage-arn
  sensitive = true
}

output "hades-backend-locking-arn" {
  value = module.hades.aws-locking-arn
  sensitive = true
}

output "hades-aws-iam-user-arn" {
  value = module.hades.aws-iam-user-arn
  sensitive = true
}

output "hades-aws-iam-user-name" {
  value = module.hades.aws-iam-user-name
  sensitive = true
}

output "hades-aws-iam-user-unique-id" {
  value = module.hades.aws-iam-user-unique-id
  sensitive = true
}   

output "hades-aws-iam-access-key-id" {
  value = module.alisida.aws-iam-access-key-id
  sensitive = true
}

output "hades-aws-iam-access-key-encrypted-secret" {
  value = module.alisida.aws-iam-access-key-encrypted-secret
  sensitive = true
}
