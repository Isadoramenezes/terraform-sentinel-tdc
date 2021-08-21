resource "google_compute_network" "vpc_demo_2" {
  name                    = "vpc-demo-2"
  auto_create_subnetworks = "true"
}