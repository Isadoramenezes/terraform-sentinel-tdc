resource "google_compute_network" "vpc_demo_1" {
  name                    = "vpc-demo-1"
  auto_create_subnetworks = "true"
}