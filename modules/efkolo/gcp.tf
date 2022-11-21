locals {
  project = "n3-efkolo"
}

# This block will require the "cloudresourcemanager.googleapis.com" API to be activated for the master project
data "google_organization" "org" {
  domain = var.domain
}

data "google_active_folder" "main" {
  display_name = var.subspace
  parent       = "organizations/${data.google_organization.org.org_id}"
}

resource "google_project" "efkolo" {
  name       = local.project
  project_id = local.project
  folder_id  = data.google_active_folder.main.name
}

# This block will require "iam.googleapis.com" API to be activated for the master project
resource "google_service_account" "tf" {
  account_id = "efkolo-tf"
  project    = google_project.efkolo.number
}

resource "google_service_account_key" "tf" {
  service_account_id = google_service_account.tf.id
}

data "google_iam_policy" "tf" {
  binding {
    role    = "roles/owner"

    members = [
      "serviceAccount:${google_service_account.tf.email}",
    ]
  }

  depends_on = [
    google_project.efkolo
  ]
}

resource "google_service_account_iam_policy" "tf" {
  service_account_id = google_service_account.tf.id
  policy_data        = data.google_iam_policy.tf.policy_data

  depends_on         = [
    data.google_iam_policy.tf,
    google_service_account.tf
  ]
}
