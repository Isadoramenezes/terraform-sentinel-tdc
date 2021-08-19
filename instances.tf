resource "google_compute_instance" "vm-demo1" {
  name         = "tdc-demo-vm-1"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_demo_1.self_link
    access_config {
    }
  }
}
