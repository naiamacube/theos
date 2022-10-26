resource "aws_s3_bucket_versioning" "backend-storage" {
  bucket = "n3-dokimi-tfstate"

  versioning_configuration {
    status = "Enabled"
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
