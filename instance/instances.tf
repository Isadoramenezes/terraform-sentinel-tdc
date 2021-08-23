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
  name         = "vm-demo2${count.index}"
  machine_type = "f1-micro"
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20210429"
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
