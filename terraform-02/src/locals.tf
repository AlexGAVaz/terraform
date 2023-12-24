locals {
  vms_metadata = {
    serial-port-enable = 1,
    ssh-keys           = "${var.vm_username}:${file("~/.ssh/id_ed25519.pub")}"
  }
}

locals {
  vms_nname = {
    web = "${var.first_name}-${var.web_name}"
    db  = "${var.first_name}-${var.db_name}"
  }
}
