output "aws-iam-user-arn" {
  value = aws_iam_user.main.arn
  sensitive = true
}

output "aws-iam-user-name" {
  value = aws_iam_user.main.name
  sensitive = true
}

output "aws-iam-user-unique-id" {
  value = aws_iam_user.main.unique_id
  sensitive = true
}

output "aws-iam-access-key-id" {
  value = aws_iam_access_key.main.id
  sensitive = true
}

output "aws-iam-access-key-encrypted-secret" {
  value = aws_iam_access_key.main.encrypted_secret
  sensitive = true
}
