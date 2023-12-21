###image vars
variable "vm_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Family of the Yandex Compute Image"
}

variable "first_name" {
  type    = string
  default = "netology-develop-platform"
}

variable "vms_resources" {
  type = map(object({
    stage_name    = string
    platform_id   = string
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    vm_web_resources = {
      stage_name    = "web"
      platform_id   = "standard-v1"
      cores         = 2
      memory        = 2
      core_fraction = 5
    }
    vm_db_resources = {
      stage_name    = "db"
      platform_id   = "standard-v1"
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

###ssh vars
variable "vm_username" {
  type        = string
  default     = "ubuntu"
  description = "Username for the VM"
}
