resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = "${var.vpc_name}_db"
  zone           = var.zone_db
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.db_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.image_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.web_instance_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_scheduling_policy_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_network_interface_nat
  }

  metadata = {
    serial-port-enable = var.vm_metadata.serial_port_enable
    ssh-keys           = "${var.vm_metadata.default_user}:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "db" {
  name        = local.db_instance_name
  platform_id = var.vm_db_platform_id
  zone        = var.zone_db
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_scheduling_policy_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_db_network_interface_nat
  }

  metadata = {
    serial-port-enable = var.vm_metadata.serial_port_enable
    ssh-keys           = "${var.vm_metadata.default_user}:${var.vms_ssh_root_key}"
  }

  # allow_stopping_for_update = true
}
