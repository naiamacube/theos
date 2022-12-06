locals {
  project = "n3-theos"
}

resource "google_service_account" "main" {
  account_id = "${local.project}-harpocrates"
  project    = local.project
}

resource "google_container_cluster" "main" {
  name     = "${local.project}-harpocrates-cluster"
  location = var.gcp_zone
  project  = local.project

  remove_default_node_pool = true
  initial_node_count       = 1

  service_external_ips_config {
    enabled = false
  }
}

resource "google_container_node_pool" "main" {
  name     = "${local.project}-harpocrate-node-pool"
  location = var.gcp_zone
  project  = local.project

  cluster    = google_container_cluster.main.name
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    machine_type = "e2-micro"
    disk_type    = "pd-standard"
    disk_size_gb = 10

    service_account = google_service_account.main.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

data "google_client_config" "default" {}

provider "helm" {
  kubernetes {
    host = google_container_cluster.main.endpoint

    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.main.master_auth.0.cluster_ca_certificate
    )   
  }
  experiments {
    manifest = true
  }
}

resource "helm_release" "vault" {
  name = "vault"

  repository       = "https://helm.releases.hashicorp.com"
  chart            = "hashicorp/vault"
  namespace        = "vault"
  version          = "0.23.0"
  create_namespace = true

  depends_on = [ 
    google_container_node_pool.main
  ]
}
