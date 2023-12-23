resource "yandex_compute_disk" "storage-disk" {
  count = 3
  name  = "disk-${count.index + 1}"
  type  = "network-hdd"
  size  = 1
}

resource "yandex_compute_instance" "storage-vm" {
  name        = "storage"
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage-disk[*].id
    content {
      disk_id = secondary_disk.value
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

  depends_on = [yandex_compute_disk.storage-disk]
}
