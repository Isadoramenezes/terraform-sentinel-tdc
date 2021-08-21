module "instances" {
  source        = "./instance"
  instances     = 2
  ufw           = var.ufw
  name_frw      = "firewall-demo-2"
  allow_ports   = var.allow_ports
  source_ranges = var.source_ranges
}

module "firewall" {
  source        = "./firewall"
  name_frw      = "firewall-demo-2"
  allow_ports   = var.allow_ports
  source_ranges = var.source_ranges
  network       = "vpc-demo-2"
}