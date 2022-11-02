locals {
  project = "n3-roii"
}

# This block will require the "cloudresourcemanager.googleapis.com" API to be activated for the master project
data "google_organization" "org" {
  domain = var.domain
}

data "google_active_folder" "main" {
  display_name = var.subspace
  parent       = "organizations/${data.google_organization.org.org_id}"
}

resource "google_project" "roii" {
  name       = local.project
  project_id = local.project
  folder_id  = data.google_active_folder.main.name
}

# This block will require "iam.googleapis.com" API to be activated for the master project
resource "google_service_account" "main" {
  account_id = "roii-tf"
  project    = google_project.roii.number
}

resource "google_service_account_key" "main" {
  service_account_id = google_service_account.tf.id
}

data "google_iam_policy" "main" {
  binding {
    role    = "roles/owner"

    members = [
      "serviceAccount:${google_service_account.tf.email}",
    ]
  }

  depends_on = [
    google_project.roii
  ]
}

resource "google_service_account_iam_policy" "main" {
  service_account_id = google_service_account.tf.id
  policy_data        = data.google_iam_policy.tf.policy_data

  depends_on         = [
    data.google_iam_policy.tf,
    google_service_account.tf
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
