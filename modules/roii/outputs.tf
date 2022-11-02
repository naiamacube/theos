output "aws-storage-arn" {
  value = aws_s3_bucket.backend-storage.arn
  sensitive = true
}

output "aws-locking-arn" {
  value = aws_dynamodb_table.backend-locking.arn
  sensitive = true
}

output "aws-iam-user-arn" {
  value = aws_iam_user.main.arn
}

output "aws-iam-user-name" {
  value = aws_iam_user.main.name
}

output "aws-iam-user-unique-id" {
  value = aws_iam_user.main.unique_id
}

output "aws-iam-tf-key" {
  value = aws_iam_access_key.main.id
  sensitive = true
}

output "aws-iam-tf-secret" {
  value = aws_iam_access_key.main.encrypted_secret
  sensitive = true
}

output "gcp-tf-email" {
  value = google_service_account.main.email
  sensitive = true
}

output "gcp-tf-publickey" {
  value = google_service_account_key.main.public_key
  sensitive = true
}

output "gcp-tf-privatekey" {
  value = google_service_account_key.main.private_key
  sensitive = true
}
