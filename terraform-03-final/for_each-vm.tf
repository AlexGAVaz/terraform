resource "yandex_compute_instance" "databases" {
  for_each = {
    main    = var.each_vm[0]
    replica = var.each_vm[1]
  }
  name        = each.value.vm_name
  platform_id = each.value.platform_id
  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = each.value.disk_type
      size     = each.value.disk
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.develop.id]
  }

  metadata = {
    serial-port-enable = local.vms_metadata.serial-port-enable
    ssh-keys           = local.vms_metadata.ssh-keys
  }

}

