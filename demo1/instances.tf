data "template_file" "nginx" {
  template = "${file("./templates/install_nginx.tpl")}"

  vars = {
    ufw_allow_nginx = "Nginx HTTP"
  }
}

resource "google_compute_instance" "vm-demo1" {
  name         = "tdc-demo-1"
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
  metadata_startup_script = data.template_file.nginx.rendered
}
