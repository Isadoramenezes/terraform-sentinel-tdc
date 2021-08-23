output "ip" {
  value = module.instances.google_compute_instance.count.index.network_interface.0.access_config.0.nat_ip
  #value = google_compute_instance.vm-demo1.network_interface.0.access_config.0.nat_ip
}