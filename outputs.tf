output "efkolo-backend-storage-arn" {
  value = module.efkolo.aws-storage-arn
  sensitive = true
}

output "efkolo-backend-locking-arn" {
  value = module.efkolo.aws-locking-arn
  sensitive = true
}

output "efkolo-backend-iam-tf-key" {
  value = module.efkolo.aws-iam-tf-key
  sensitive = true
}

output "efkolo-backend-iam-tf-secret" {
  value = module.efkolo.aws-iam-tf-secret
  sensitive = true
}

output "efkolo-gcp-tf-email" {
  value = module.efkolo.gcp-tf-email
  sensitive = true
}

output "efkolo-gcp-tf-publickey" {
  value = module.efkolo.gcp-tf-publickey
  sensitive = true
}

output "efkolo-gcp-tf-privatekey" {
  value = module.efkolo.gcp-tf-privatekey
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

output "symplegma-backend-storage-arn" {
  value = module.symplegma.aws-storage-arn
  sensitive = true
}

output "symplegma-backend-locking-arn" {
  value = module.symplegma.aws-locking-arn
  sensitive = true
}

output "symplegma-aws-iam-user-arn" {
  value = module.symplegma.aws-iam-user-arn
  sensitive = true
}

output "symplegma-aws-iam-user-name" {
  value = module.symplegma.aws-iam-user-name
  sensitive = true
}

output "symplegma-aws-iam-user-unique-id" {
  value = module.symplegma.aws-iam-user-unique-id
  sensitive = true
}   

output "symplegma-aws-iam-access-key-id" {
  value = module.alisida.aws-iam-access-key-id
  sensitive = true
}

output "symplegma-aws-iam-access-key-encrypted-secret" {
  value = module.alisida.aws-iam-access-key-encrypted-secret
  sensitive = true
}
