resource "aws_s3_bucket_versioning" "backend-storage" {
  bucket = "n3-dokimi-tfstate"

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "backend-locking" {
  name = "n3-dokimi-tfstate"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
