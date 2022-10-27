terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.32.0"
    }
    google = {
      source = "hashicorp/google"
      version = "4.37.0"
    }
  }

  required_version = "> 1.2.8"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}

provider "google" {
  credentials = var.gcp_credentials
  region = var.gcp_region
}

resource "aws_s3_bucket" "backend-storage" {
  bucket = var.aws_backend
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
  name = var.aws_backend
  hash_key = "LockID"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_iam_user" "tf" {
  name = var.dokimi_iam
  path = "/"
}

resource "aws_iam_policy" "tf" {
  name = var.dokimi_iam
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:ListBucket",]
        Resource = aws_s3_bucket.backend-storage.arn
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "${aws_s3_bucket.backend-storage.arn}/dokimi.tfstate"
      },
      {
        Effect = "Allow"
        Action = [
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

resource "aws_iam_user_policy_attachement" "tf" {
  user = aws_iam_user.tf.name
  policy_arn = aws_iam_policy.tf.arn
}

resource "aws_iam_access_key" "tf" {
  user = aws_iam_user.tf.name
  pgp_key = var.pgp_key
}
