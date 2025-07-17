resource "yandex_compute_instance" "web" {
  count = 2

  name = "web-${count.index + 1}"
  zone = var.default_zone

  platform_id = var.vms_web.platform_id
  resources {
    cores         = var.vms_web.cpu
    memory        = var.vms_web.ram
    core_fraction = var.vms_web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id         = yandex_vpc_subnet.develop.id
    nat               = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    # ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  depends_on = [yandex_compute_instance.dbs]

  allow_stopping_for_update = true

  lifecycle {
    create_before_destroy = true
  }

  scheduling_policy {
    preemptible = var.vms_web.preemptible
  }
}