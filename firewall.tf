resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_demo_1.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["http-server"]
  source_ranges = ["0.0.0.0/0"]

  depends_on = [
    google_compute_network.vpc_demo_1
  ]
}

resource "google_compute_firewall" "ssh" {
  name    = "firewall-ssh"
  network = google_compute_network.vpc_demo_1.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
    depends_on = [
    google_compute_network.vpc_demo_1
  ]
}