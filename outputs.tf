output "dokimi-backend-storage-arn" {
  value = aws_s3_bucket.backend-storage.arn
  sensitive = true
}

output "dokimi-backend-locking-arn" {
  value = aws_dynamodb_table.backend-locking.arn
  sensitive = true
}

