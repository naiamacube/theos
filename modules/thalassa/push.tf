resource "tfe_workspace" "main" {
  name         = "n3-thalassa"
  organization = "naiama"
}

resource "tfe_variable" "aws-iam-user-arn" {
  key          = "aws-iam-user-arn"
  value        = aws_iam_user.main.arn
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.main.id
}

resource "tfe_variable" "aws-iam-user-name" {
  key          = "aws-iam-user-name"
  value        = aws_iam_user.main.name
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.main.id
}

resource "tfe_variable" "aws-iam-user-unique-id" {
  key          = "aws-iam-user-unique-id"
  value        = aws_iam_user.main.unique_id
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.main.id
}

resource "tfe_variable" "aws-iam-access-key-id" {
  key          = "aws-iam-access-key-id"
  value        = aws_iam_access_key.main.id
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.main.id
}

resource "tfe_variable" "aws-iam-access-key-encrypted-secret" {
  key          = "aws-iam-access-key-encrypted-secret"
  value        = aws_iam_access_key.main.encrypted_secret
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.main.id
}

