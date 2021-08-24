variable "zone" {
  default = "us-central1-c"
}

variable "region" {
  default = "us-central1"
}

variable "project" {
  default = "terraform-sentinel-tdc"
}

variable "ufw" {
  default = "Nginx HTTP"
}

variable "name_frw" {
  default = "firewall demo 2"
}

variable "source_ranges" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "allow_ports" {
  type    = list(any)
  default = ["22", "80", "8080", "1000-2000"]
}

variable "network" {
  default = "vpc-demo-2"
}

variable "machine_type" {
  default = "e2-standard-16"
}
