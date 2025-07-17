resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl",
    {
      webservers = yandex_compute_instance.web
      databases  = yandex_compute_instance.dbs
      storage    = [yandex_compute_instance.storage]
    }
  )
  filename = "${abspath(path.module)}/hosts.ini"
}