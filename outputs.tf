output "dokimi-backend-storage-id" {
  value = aws_s3_bucket_versioning.backend-storage.id
  sensitive = true
}

output "dokimi-backend-locking-arn" {
  value = aws_s3_bucket_versioning.backend-storage.arn
  sensitive = true
}

