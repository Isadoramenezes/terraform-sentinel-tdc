output "ip" {
  value = google_compute_instance.vm-demo1.network_interface.access_config.nat_ip
}