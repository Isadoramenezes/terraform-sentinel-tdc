resource "google_compute_firewall" "default" {
  name    = var.name_frw
  #network = "vpc-demo-2"
  network = "vpc-demo-2"

  allow {
    protocol = "tcp"
    ports    = var.allow_ports
  }

  target_tags   = ["http-server"]
  source_ranges = var.source_ranges

  source_tags = ["http-server"]
}

