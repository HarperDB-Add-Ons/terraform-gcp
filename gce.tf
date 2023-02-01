resource "google_compute_instance" "harperdb" {
  name         = "harperdb"
  machine_type = "e2-medium"
  zone         = "us-east4-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}