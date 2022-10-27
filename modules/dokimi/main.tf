provider "aws" {
  region = var.dokimi_aws_region
}

resource "aws_s3_bucket" "backend-storage" {
  bucket = var.dokimi_aws_backend
  object_lock_enabled = true
}

resource "aws_s3_bucket_public_access_block" "backend-storage" {
  bucket = aws_s3_bucket.backend-storage.bucket

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "backend-storage" {
  bucket = aws_s3_bucket.backend-storage.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend-storage" {
  bucket = aws_s3_bucket.backend-storage.bucket

  rule {
    bucket_key_enabled = true
  }
}

resource "aws_dynamodb_table" "backend-locking" {
  name = var.dokimi_aws_backend
  hash_key = "LockID"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}