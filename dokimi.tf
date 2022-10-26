resource "aws_s3_bucket" "backend-storage" {
  bucket = "n3-dokimi-tfstate"
  object_lock_enabled = true
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
  name = "n3-dokimi-tfstate"
  hash_key = "LockID"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}
