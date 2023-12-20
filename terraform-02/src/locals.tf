locals {
  first_name = "netology-develop-platform"
  stage_name = {
    web = "web",
    db  = "db"
  }
}

locals {
  vms_resources = {
    vm_web_resources = {
      platform_id   = "standard-v1"
      cores         = 2
      memory        = 2
      core_fraction = 5
    },
    vm_db_resources = {
      platform_id   = "standard-v1"
      cores         = 2
      memory        = 2
      core_fraction = 20
    },
  }
}

locals {
  vms_metadata = {
    serial-port-enable = 1,
    ssh-keys           = "${var.vm_username}:${var.vms_ssh_root_key}",
  }
}

