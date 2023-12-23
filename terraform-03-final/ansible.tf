resource "local_file" "ansible_inventory" {
  filename = "./inventory.yml"
  content = templatefile("ansible.tftpl", {
    webservers = yandex_compute_instance.count-web,
    databases  = yandex_compute_instance.databases,
    storage    = yandex_compute_instance.storage-vm,
  })
}
