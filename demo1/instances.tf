data "template_file" "nginx" {
  template = "${file("./templates/nginx.tpl")}"

  vars = {
    ufw_allow_nginx = "Nginx HTTP"
  }
}


resource "google_compute_instance" "vm-demo1" {
  name         = "tdc-demo-1"
  machine_type = "f1-micro"
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20210429"
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
