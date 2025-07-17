resource "yandex_compute_disk" "hdd" {
  count = 3
  name  = "${var.vms_storage_hdd.name}-${count.index + 1}"
  size  = var.vms_storage_hdd.size
  type  = var.vms_storage_hdd.type
  zone = var.default_zone
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
  zone = var.default_zone

  platform_id = var.vms_storage.platform_id
  resources {
    cores = var.vms_storage.cpu
    memory = var.vms_storage.ram
    core_fraction = var.vms_storage.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  # Подключение дисков через dynamic
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.hdd[*].id
    content {
      disk_id = secondary_disk.value
    }
  }
  
  allow_stopping_for_update = true

  lifecycle {
    create_before_destroy = true
  }

  scheduling_policy {
    preemptible = var.vms_storage.preemptible
  }
}