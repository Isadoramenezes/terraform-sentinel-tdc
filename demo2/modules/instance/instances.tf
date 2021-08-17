resource "google_compute_instance" "vm-demo2" {
  count        = var.instances
  name         = "tdc-vm-${count.index}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_demo_2.self_link
    access_config {
    }
  }
}
