output "ip" {
  value = google_compute_instance.vm-demo1.network_interface.0.network_ip
}