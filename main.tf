terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "netbr"

    workspaces {
      name = "terraform-sentinel-tdc"
    }
  }
}


provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}