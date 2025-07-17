###cloud vars
/* variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
} */

variable "cloud_id" {
  type        = string
  default     = "b1gtj5a6miscu26ler9f"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g9ffchvbvlsbefir7i"
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

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}

/* variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdl1NLqfHSY6kh6wPj/QEKB7BZOXgZhHw9S6tgcq/GzG/UAhqYONiTi/ux3zL+psUqXphH85lZSDKEZvRFmD5YeY7zI0LsDkb39xSrGIAXCCXe3PK7PmiGSjUOKRi1kXHDPIb/+Ukvv2Z7Wn26cWP4idQbCIZ7NuHUQZh6dRpfZUCUe5WfkwqwrKxlEZT1KhhjH4GjbnTuxP1uwNJUydseNE3gVa/dzclUIn8gtnI/C+02rTE6D1UX/yKX4I9Jc4oIuNrEwXvpzi987EAOmFtpLVNGI7Xty3PSfrmfXhrp/8SMKRCAH1KCdMDxC+Hn9TRh5sVcyhb3EbH/2q0bygnB lime14@lime14-pc"
  description = "ssh-keygen -t ed25519"
} */

variable "vms_web" {
  description = "Все ВМ"
  type = map
  default = {
      vm_name     = "web"
      platform_id = "standard-v1"
      cpu         = 2
      core_fraction = 5
      ram         = 2
      disk_volume = 5
      preemptible = true
    }
}

variable "vms_db" {
  description = "ВМ для БД"
  type = list(object({
    vm_name     = string
    platform_id = string
    cpu         = number
    core_fraction = number
    ram         = number
    disk_volume = number
    preemptible = bool
  }))
  default = [
    {
      vm_name     = "main"
      platform_id = "standard-v1"
      cpu         = 4
      core_fraction = 5
      ram         = 2
      disk_volume = 10
      preemptible = true
    },
    {
      vm_name     = "replica"
      platform_id = "standard-v1"
      cpu         = 2
      core_fraction = 5
      ram         = 1
      disk_volume = 5
      preemptible = true
    }
  ]
}

variable "vms_storage" {
  description = "ВМ для хранения"
  type = map
  default = {
    vm_name     = "storage"
    platform_id = "standard-v1"
    cpu         = 2
    core_fraction = 5
    ram         = 1
    disk_volume = 5
    preemptible = true
  }
}

variable "vms_storage_hdd" {
  description = "HDD"
  type = map
  default = {
    name = "hdd"
    size = 1
    type = "network-hdd"
  }
}
