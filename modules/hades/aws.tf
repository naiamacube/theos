locals {
  aws_backend_name = "n3-hades-tfstate"
  aws_s3_bucket    = "n3-hades"
  aws_iam_name     = "n3-hades-tf"
}

resource "aws_s3_bucket" "main" {
  bucket              = local.aws_s3_bucket
  object_lock_enabled = true
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "backend-storage" {
  bucket = aws_s3_bucket.main.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.bucket

  rule {
    bucket_key_enabled = true
  }
}

resource "aws_dynamodb_table" "main" {
  name = local.aws_backend_name
  hash_key = "LockID"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_iam_user" "main" {
  name = local.aws_iam_name
  path = "/"
}

resource "aws_iam_policy" "main" {
  name = local.aws_iam_name
  path = "/"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket",]
        Resource = aws_s3_bucket.main.arn
      },
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = "${aws_s3_bucket.main.arn}/hades.tfstate"
      },
    ]
  })
}

resource "aws_iam_user_policy_attachment" "main" {
  user       = aws_iam_user.main.name
  policy_arn = aws_iam_policy.main.arn
}

resource "aws_iam_access_key" "main" {
  user    = aws_iam_user.main.name
  pgp_key = var.pgp_key
}
