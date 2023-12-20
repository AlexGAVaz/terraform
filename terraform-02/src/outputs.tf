
output "vm_instance_name_ip_platform-web" {
  value = {
    for instance in ["${yandex_compute_instance.platform-web.name}"] :
    instance => yandex_compute_instance.platform-web.network_interface[0].nat_ip_address
  }
}

output "vm_instance_name_ip_platform-db" {
  value = {
    for instance in ["${yandex_compute_instance.platform-db.name}"] :
    instance => yandex_compute_instance.platform-db.network_interface[0].nat_ip_address
  }
}
