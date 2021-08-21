data "google_compute_network""vpc-demo-2" {
  name = "vpc-demo-2"
}

resource "google_compute_firewall" "default" {
  name    = var.name_frw
  network = data.google_compute_network.vpc-demo-2.name

  allow {
    protocol = "tcp"
    ports    = var.allow_ports
  }

  target_tags   = ["http-server"]
  source_ranges = var.source_ranges

  source_tags = ["http-server"]
}

