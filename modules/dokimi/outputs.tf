output "aws-storage-arn" {
  value = aws_s3_bucket.backend-storage.arn
  sensitive = true
}

output "aws-locking-arn" {
  value = aws_dynamodb_table.backend-locking.arn
  sensitive = true
}

output "aws-iam-tf-key" {
  value = aws_iam_access_key.tf.id
  sensitive = true
}

output "aws-iam-tf-secret" {
  value = aws_iam_access_key.tf.encrypted_secret
  sensitive = true
}

output "gcp-tf-email" {
  value = google_service_account.tf.email
  sensitive = true
}

output "gcp-tf-publickey" {
  value = google_service_account_key.tf.public_key
  sensitive = true
}

output "gcp-tf-privatekey" {
  value = google_service_account_key.tf.private_key
  sensitive = true
}
