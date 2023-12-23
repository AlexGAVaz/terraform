locals {
  vms_metadata = {
    serial-port-enable = 1,
    ssh-keys           = "${var.vm_username}:${file("~/.ssh/id_ed25519.pub")}"
  }
}
