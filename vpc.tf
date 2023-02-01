resource "google_compute_network" "vpc_network" {
  name                    = "harperdb-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "default" {
  name          = "harperdb-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east4"
  network       = google_compute_network.vpc_network.id
}