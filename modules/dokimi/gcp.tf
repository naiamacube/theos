locals {
  project = "n3-dokimi"
}

data "google_organization" "org" {
  domain = var.organization
}

resource "google_project" "dokimi" {
  name       = local.project
  project_id = local.project
  org_id     = data.google_organization.org.org_id
  folder_id  = var.subspace
}

resource "google_project_service" "dokimi" {
  project = google_project.dokimi.id
  service = "compute.googleapis.com"
}

resource "google_service_account" "tf" {
  account_id = "dokimi-tf"
  project    = google_project.dokimi.id
}

resource "google_service_account_key" "tf" {
  service_account_id = google_service_account.tf.id
}

data "google_iam_policy" "tf" {
  binding {
    role    = "roles/owner"

    members = [
      "user:${google_service_account.tf.email}",
    ]
  }
}

resource "google_service_account_iam_policy" "tf" {
  service_account_id = google_service_account.tf.id
  policy_data        = data.google_iam_policy.tf.policy_data
}
