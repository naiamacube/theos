locals {
  aws_backend_name = "n3-artemis-tfstate"
  aws_iam_name     = "n3-artemis-tf"
}

resource "aws_s3_bucket" "backend-storage" {
  bucket              = local.aws_backend_name
  object_lock_enabled = true
}

resource "aws_s3_bucket_public_access_block" "backend-storage" {
  bucket                  = aws_s3_bucket.backend-storage.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
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
  name            = local.aws_backend_name
  hash_key        = "LockID"
  read_capacity   = 1
  write_capacity  = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_iam_user" "tf" {
  name = local.aws_iam_name
  path = "/"
}

resource "aws_iam_policy" "tf" {
  name = local.aws_iam_name
  path = "/"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket",]
        Resource = aws_s3_bucket.backend-storage.arn
      },
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "${aws_s3_bucket.backend-storage.arn}/artemis.tfstate"
      },
      {
        Effect   = "Allow"
        Action   = [
          "dynamodb:DescribeTable",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem"
        ]
        Resource = aws_dynamodb_table.backend-locking.arn
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "tf" {
  user       = aws_iam_user.tf.name
  policy_arn = aws_iam_policy.tf.arn
}

resource "aws_iam_access_key" "tf" {
  user    = aws_iam_user.tf.name
  pgp_key = var.pgp_key
}
