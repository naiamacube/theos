resource "google_compute_image" "leicester" {
  name    = "leicester"
  project = "n3-theos"
}

resource "google_compute_address" "vault-static" {
  name = "vault-static"
}

resource "google_compute_disk" "vault" {
  name  = "vault-boot"

  type  = "sd"
  zone  = var.gcp_zone
  image = google_compute_image.leicester.self_link
  size  = 10
}

resource "google_compute_instance" "vault" {
  name         = "vault"

  machine_type = "e2-micro"
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = google_compute_disk.vault.self_link
    }
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  network_interface {
    access_config {
      nat_ip = google_compute_address.vault-static.address
    }
  }

  # The following option should be enabled in production.
  # DO NOT USE AS-IS
  # confidentials_instance_config {
    # enable_confidential_compute = true
  # }
  # 
  # scheduling {
    # on_host_maintenance = "TERMINATE"
  # }
}
