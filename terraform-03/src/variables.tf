###cloud vars
variable "yc_token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "yc_cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "yc_folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###image vars
variable "vm_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Family of the Yandex Compute Image"
}

###vm databases vars
variable "each_vm" {
  type = list(object({
    platform_id   = string,
    vm_name       = string,
    disk_type     = string,
    cores         = number,
    memory        = number,
    disk          = number,
    core_fraction = number
  }))
  default = [
    { platform_id = "standard-v1", vm_name = "main", disk_type = "network-hdd", cores = 4, memory = 4, disk = 20, core_fraction = 5 },
    { platform_id = "standard-v1", vm_name = "replica", disk_type = "network-hdd", cores = 2, memory = 2, disk = 10, core_fraction = 5 }
  ]
}

###ssh ubuntu
variable "vm_username" {
  type        = string
  default     = "ubuntu"
  description = "Username for the VM"
}
