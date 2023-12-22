output "vm_instances" {
  value = concat(
    [
      for i in range(length(yandex_compute_instance.count-web)) : {
        "name" = yandex_compute_instance.count-web[i].name
        "id"   = yandex_compute_instance.count-web[i].id
        "fqdn" = "internal-fqdn-${i + 1}"
      }
    ],
    [
      for i in range(length(yandex_compute_instance.storage-vm)) : {
        "name" = yandex_compute_instance.storage-vm[i].name
        "id"   = yandex_compute_instance.storage-vm[i].id
        "fqdn" = "internal-fqdn-${length(yandex_compute_instance.count-web) + i + 1}"
      }
    ],
    [
      for name, instance in yandex_compute_instance.databases : {
        "name" = instance.name
        "id"   = instance.id
        "fqdn" = "internal-fqdn-${length(yandex_compute_instance.count-web) + length(yandex_compute_instance.storage-vm) + 1}"
      }
    ],
  )
}
