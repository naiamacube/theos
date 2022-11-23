locals {
  project      = "n3-zeus"
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

resource "google_project" "zeus" {
  name            = local.project
  project_id      = local.project
  folder_id       = data.google_active_folder.main.name

  billing_account = data.google_billing_account.main.id
}

# This block will require "iam.googleapis.com" API to be activated for the master project
resource "google_service_account" "main" {
  account_id = "zeus-tf"
  project    = google_project.zeus.number
}

resource "google_service_account_key" "main" {
  service_account_id = google_service_account.main.id
}

resource "google_project_iam_binding" "main" {
  project = google_project.zeus.number
  role    = "roles/owner"

  members = [
    "serviceAccount:${google_service_account.main.email}",
  ]

  depends_on = [
    google_project.zeus,
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

  project  = google_project.zeus.project_id
  service  = each.key
}

# It would have been sick to be able to dynamically create context and push credentials based on infra resource creation, but because of the poor CircleCI API for dealing w/ contexts, OR Terraform poor code control flow management, it's a dead dream for now... Going manual & Moving on.
/*
data "http" "create-context" {
  method = "POST"
  url    = "${local.circleci_url}/context"

  request_headers = {
    Accept       = "application/json"
    Content-Type = "application/json"
    Circle-Token = var.circleci_token
  }

  request_body = jsonencode({
    "name" = local.project,
    "owner" = {
      "id" = var.circleci_org_id,
      "type" = "organization"
    }
  })
}

data "http" "push-gcp-sa-name" {
  method = "POST"
  url    = "${local.circleci_url}/context/${jsondecode(data.http.create-context.response_body).id}/environment-variable/gcp_sa_name"

  request_headers = {
    Accept       = "application/json"
    Content-Type = "application/json"
    Circle-Token = var.circleci_token
  }

  request_body = jsonencode({
    "value" = "${google_service_account_key.main.name}"
  })
}

data "http" "push-gcp-sa-private-key" {
  method = "POST"
  url    = "${local.circleci_url}/context/${jsondecode(data.http.create-context.response_body).id}/environment-variable/gcp_sa_credentials"

  request_headers = {
    Accept       = "application/json"
    Content-Type = "application/json"
    Circle-Token = var.circleci_token
  }

  request_body = jsonencode({
    "value" = "${google_service_account_key.main.private_key}"
  })
}
*/
