resource "yandex_compute_instance" "dbs" {
  for_each = { for index, value in var.vms_db : index => value }

  name = each.value.vm_name
  zone = var.default_zone

  platform_id = each.value.platform_id

  resources {
    cores = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      size = each.value.disk_volume
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id         = yandex_vpc_subnet.develop.id
    nat               = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  allow_stopping_for_update = true

  lifecycle {
    create_before_destroy = true
  }

  scheduling_policy {
    preemptible = each.value.preemptible
  }
}