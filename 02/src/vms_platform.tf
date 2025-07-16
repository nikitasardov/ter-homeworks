###cloud vars


variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}

/* variable "vm_web_resources" {
  type        = map(number)
  default     = {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
} */

variable "vm_web_scheduling_policy_preemptible" {
  type        = bool
  default     = true
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}

variable "vm_web_network_interface_nat" {
  type        = bool
  default     = true
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}


###db vars


variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}

/*variable "vm_db_resources" {
  type        = map(number)
  default     = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
} */

variable "vms_resources" {
  type        = map(any)
  default     = {
     web={
       cores=2
       memory=1
       core_fraction=5
     },
     db= {
       cores=2
       memory=2
       core_fraction=20
     }
   }
}

variable "vm_db_scheduling_policy_preemptible" {
  type        = bool
  default     = true
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}

variable "vm_db_network_interface_nat" {
  type        = bool
  default     = true
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}

/* variable "vm_db_metadata" {
  type        = map(any)
  default     = {
    serial_port_enable = 1
    default_user       = "ubuntu"
  }
}

variable "vm_web_metadata" {
  type        = map(any)
  default     = {
    serial_port_enable = 1
    default_user       = "ubuntu"
  }
}*/

variable "vm_metadata" {
  type        = map(any)
  default     = {
    serial_port_enable = 1
    default_user       = "ubuntu"
  }
}