locals {
  project = "n3-dokimi"
}

data "google_folder" "main" {
  folder = var.subspace
}

resource "google_project" "dokimi" {
  name       = local.project
  project_id = local.project
  folder_id  = data.google_folder.main.id
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
