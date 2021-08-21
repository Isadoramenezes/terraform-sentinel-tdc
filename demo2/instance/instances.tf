data "template_file" "nginx" {
  template = "${file("./templates/nginx.tpl")}"

  vars = {
    ufw_allow_nginx = var.ufw
  }
}


data "google_compute_network""vpc-demo-2" {
  name = "vpc-demo-2"
}

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
    network = data.google_compute_network.vpc-demo-2.name
    access_config {
    }
  }
  metadata_startup_script =  data.template_file.nginx.rendered
}