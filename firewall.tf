resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "harperdb" {
  name    = "harperdb-firewall"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["9925", "9926"]
  }
  source_ranges = ["0.0.0.0/0"]
}

// A variable for extracting the external IP address of the VM
output "harperdb-URL" {
 value = join("",["http://",google_compute_instance.harperdb.network_interface.0.access_config.0.nat_ip,":9925"])
}