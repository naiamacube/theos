locals {
  project      = "n3-roii"
  circleci_url = "https://circleci.com/api/v2"
}

# This block will require the "cloudresourcemanager.googleapis.com" API to be activated for the master project
data "google_organization" "org" {
  domain = var.domain
}

data "google_active_folder" "main" {
  display_name = var.subspace
  parent       = "organizations/${data.google_organization.org.org_id}"
}

# This block will require the "cloudbilling.googleapis.com" API to be activated for the master project
data "google_billing_account" "main" {
  billing_account = var.gcp_billing_id
  open            = true
}

resource "google_project" "roii" {
  name            = local.project
  project_id      = local.project
  folder_id       = data.google_active_folder.main.name

  billing_account = data.google_billing_account.main.id
}

# This block will require "iam.googleapis.com" API to be activated for the master project
resource "google_service_account" "main" {
  account_id = "roii-tf"
  project    = google_project.roii.number
}

resource "google_service_account_key" "main" {
  service_account_id = google_service_account.main.id
}

data "google_iam_policy" "main" {
  binding {
    role    = "roles/owner"

    members = [
      "serviceAccount:${google_service_account.main.email}",
    ]
  }

  depends_on = [
    google_project.roii
  ]
}

resource "google_service_account_iam_policy" "main" {
  service_account_id = google_service_account.main.id
  policy_data        = data.google_iam_policy.main.policy_data

  depends_on         = [
    data.google_iam_policy.main,
    google_service_account.main
  ]
}

resource "google_project_service" "foreach" {
  for_each = toset([
    "serviceusage.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "iam.googleapis.com",
    "servicemanagement.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "ml.googleapis.com",
    "iap.googleapis.com",
    "sqladmin.googleapis.com",
    "meshconfig.googleapis.com",
    "krmapihosting.googleapis.com",
    "servicecontrol.googleapis.com",
    "endpoints.googleapis.com"
  ])

  project  = google_project.roii.project_id
  service  = each.key
}

data "http" "create-context" {
  method = "POST"
  url    = "${local.circleci_url}/context"

  request_header = {
    Accept       = "application/json"
    Content-Type = "application/json"
    Circle-Token = var.circleci_token
  }

  request_body = jsonencode({
    "name" = local.project,
    "owner" = {
      "id" = var.circleci_user_id,
      "type" = "account"
    }
  })
}

data "http" "push-credentials" {
  method = "PUT"
  url    = "${local.circleci_url}/context/${jsondecode(data.http.create-context).response_body.id}/environment-variable/gcp_credentials"

  request_header = {
    Accept       = "application/json"
    Content-Type = "application/json"
    Circle-Token = var.circleci_token
  }

  request_body = jsonencode({
    "value" = jsondecode(data.http.create-context).response_body.id
  })
}
