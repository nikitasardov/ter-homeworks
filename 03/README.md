# Домашнее задание к занятию «Управляющие конструкции в коде Terraform»

### Цели задания

1. Отработать основные принципы и методы работы с управляющими конструкциями Terraform.
2. Освоить работу с шаблонизатором Terraform (Interpolation Syntax).

------

### Чек-лист готовности к домашнему заданию

1. Зарегистрирован аккаунт в Yandex Cloud. Использован промокод на грант.
2. Установлен инструмент Yandex CLI.
3. Доступен исходный код для выполнения задания в директории [**03/src**](https://github.com/netology-code/ter-homeworks/tree/main/03/src).
4. Любые ВМ, использованные при выполнении задания, должны быть прерываемыми, для экономии средств.

------

### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
Убедитесь что ваша версия **Terraform** ~>1.8.4
Теперь пишем красивый код, хардкод значения не допустимы!
------

### Задание 1

1. Изучите проект.
2. Инициализируйте проект, выполните код. 


Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud .
![](https://i.postimg.cc/rsDvcM8q/ingress.png)
------

### Задание 2

1. Создайте файл count-vm.tf. Опишите в нём создание двух **одинаковых** ВМ  web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент **count loop**. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/03/src (terraform-03)$: terraform apply
data.yandex_compute_image.ubuntu: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enp2iup0avv00p0b0jbf]
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd88h22en6kf0uhptpk5]
yandex_vpc_subnet.develop: Refreshing state... [id=e9b4e9a78u35kr4adghi]
yandex_vpc_security_group.example: Refreshing state... [id=enpht4o1e9737674losb]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.web[0] will be created
  + resource "yandex_compute_instance" "web" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdl1NLqfHSY6kh6wPj/QEKB7BZOXgZhHw9S6tgcq/GzG/UAhqYONiTi/ux3zL+psUqXphH85lZSDKEZvRFmD5YeY7zI0LsDkb39xSrGIAXCCXe3PK7PmiGSjUOKRi1kXHDPIb/+Ukvv2Z7Wn26cWP4idQbCIZ7NuHUQZh6dRpfZUCUe5WfkwqwrKxlEZT1KhhjH4GjbnTuxP1uwNJUydseNE3gVa/dzclUIn8gtnI/C+02rTE6D1UX/yKX4I9Jc4oIuNrEwXvpzi987EAOmFtpLVNGI7Xty3PSfrmfXhrp/8SMKRCAH1KCdMDxC+Hn9TRh5sVcyhb3EbH/2q0bygnB lime14@lime14-pc"
        }
      + name                      = "web-1"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd88h22en6kf0uhptpk5"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = [
              + "enpht4o1e9737674losb",
            ]
          + subnet_id          = "e9b4e9a78u35kr4adghi"
        }

      + resources {
          + core_fraction = 5
          + cores         = 2
          + memory        = 1
        }
    }

  # yandex_compute_instance.web[1] will be created
  + resource "yandex_compute_instance" "web" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdl1NLqfHSY6kh6wPj/QEKB7BZOXgZhHw9S6tgcq/GzG/UAhqYONiTi/ux3zL+psUqXphH85lZSDKEZvRFmD5YeY7zI0LsDkb39xSrGIAXCCXe3PK7PmiGSjUOKRi1kXHDPIb/+Ukvv2Z7Wn26cWP4idQbCIZ7NuHUQZh6dRpfZUCUe5WfkwqwrKxlEZT1KhhjH4GjbnTuxP1uwNJUydseNE3gVa/dzclUIn8gtnI/C+02rTE6D1UX/yKX4I9Jc4oIuNrEwXvpzi987EAOmFtpLVNGI7Xty3PSfrmfXhrp/8SMKRCAH1KCdMDxC+Hn9TRh5sVcyhb3EbH/2q0bygnB lime14@lime14-pc"
        }
      + name                      = "web-2"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd88h22en6kf0uhptpk5"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = [
              + "enpht4o1e9737674losb",
            ]
          + subnet_id          = "e9b4e9a78u35kr4adghi"
        }

      + resources {
          + core_fraction = 5
          + cores         = 2
          + memory        = 1
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_instance.web[0]: Creating...
yandex_compute_instance.web[1]: Creating...
yandex_compute_instance.web[0]: Still creating... [10s elapsed]
yandex_compute_instance.web[1]: Still creating... [10s elapsed]
yandex_compute_instance.web[0]: Still creating... [20s elapsed]
yandex_compute_instance.web[1]: Still creating... [20s elapsed]
yandex_compute_instance.web[0]: Still creating... [30s elapsed]
yandex_compute_instance.web[1]: Still creating... [30s elapsed]
yandex_compute_instance.web[0]: Still creating... [40s elapsed]
yandex_compute_instance.web[1]: Still creating... [40s elapsed]
yandex_compute_instance.web[0]: Creation complete after 43s [id=fhmlj38q72sosjk146ta]
yandex_compute_instance.web[1]: Still creating... [50s elapsed]
yandex_compute_instance.web[1]: Still creating... [1m0s elapsed]
yandex_compute_instance.web[1]: Creation complete after 1m3s [id=fhmor0dgdemeh92ofp7b]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/03/src (terraform-03)$: 
```

2. Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" **разных** по cpu/ram/disk_volume , используя мета-аргумент **for_each loop**. Используйте для обеих ВМ одну общую переменную типа:
```
variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
}
```  
При желании внесите в переменную все возможные параметры.
1. ВМ из пункта 2.1 должны создаваться после создания ВМ из пункта 2.2.
2. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.
3. Инициализируйте проект, выполните код.
```
  Enter a value: yes

yandex_compute_instance.dbs["0"]: Modifying... [id=fhmhfm1kut1avi8tsd5e]
yandex_compute_instance.dbs["1"]: Modifying... [id=fhm4mj30kkb37o9b8na3]
yandex_compute_instance.dbs["0"]: Still modifying... [id=fhmhfm1kut1avi8tsd5e, 10s elapsed]
yandex_compute_instance.dbs["1"]: Still modifying... [id=fhm4mj30kkb37o9b8na3, 10s elapsed]
yandex_compute_instance.dbs["0"]: Still modifying... [id=fhmhfm1kut1avi8tsd5e, 20s elapsed]
yandex_compute_instance.dbs["1"]: Still modifying... [id=fhm4mj30kkb37o9b8na3, 20s elapsed]
yandex_compute_instance.dbs["0"]: Still modifying... [id=fhmhfm1kut1avi8tsd5e, 30s elapsed]
yandex_compute_instance.dbs["1"]: Still modifying... [id=fhm4mj30kkb37o9b8na3, 30s elapsed]
yandex_compute_instance.dbs["0"]: Still modifying... [id=fhmhfm1kut1avi8tsd5e, 40s elapsed]
yandex_compute_instance.dbs["1"]: Still modifying... [id=fhm4mj30kkb37o9b8na3, 40s elapsed]
yandex_compute_instance.dbs["1"]: Modifications complete after 46s [id=fhm4mj30kkb37o9b8na3]
yandex_compute_instance.dbs["0"]: Still modifying... [id=fhmhfm1kut1avi8tsd5e, 50s elapsed]
yandex_compute_instance.dbs["0"]: Still modifying... [id=fhmhfm1kut1avi8tsd5e, 1m0s elapsed]
yandex_compute_instance.dbs["0"]: Modifications complete after 1m7s [id=fhmhfm1kut1avi8tsd5e]
yandex_compute_instance.web[1]: Modifying... [id=fhmor0dgdemeh92ofp7b]
yandex_compute_instance.web[0]: Modifying... [id=fhmlj38q72sosjk146ta]
yandex_compute_instance.web[1]: Still modifying... [id=fhmor0dgdemeh92ofp7b, 10s elapsed]
yandex_compute_instance.web[0]: Still modifying... [id=fhmlj38q72sosjk146ta, 10s elapsed]
yandex_compute_instance.web[0]: Still modifying... [id=fhmlj38q72sosjk146ta, 20s elapsed]
yandex_compute_instance.web[1]: Still modifying... [id=fhmor0dgdemeh92ofp7b, 20s elapsed]
yandex_compute_instance.web[0]: Still modifying... [id=fhmlj38q72sosjk146ta, 30s elapsed]
yandex_compute_instance.web[1]: Still modifying... [id=fhmor0dgdemeh92ofp7b, 30s elapsed]
yandex_compute_instance.web[0]: Still modifying... [id=fhmlj38q72sosjk146ta, 40s elapsed]
yandex_compute_instance.web[1]: Still modifying... [id=fhmor0dgdemeh92ofp7b, 40s elapsed]
yandex_compute_instance.web[0]: Modifications complete after 41s [id=fhmlj38q72sosjk146ta]
yandex_compute_instance.web[1]: Still modifying... [id=fhmor0dgdemeh92ofp7b, 50s elapsed]
yandex_compute_instance.web[1]: Modifications complete after 52s [id=fhmor0dgdemeh92ofp7b]

Apply complete! Resources: 0 added, 4 changed, 0 destroyed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/03/src (terraform-03)$: 
```
------

### Задание 3

1. Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле **disk_vm.tf** .
2. Создайте в том же файле **одиночную**(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage"  . Используйте блок **dynamic secondary_disk{..}** и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

```
Plan: 4 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_disk.hdd[1]: Creating...
yandex_compute_disk.hdd[0]: Creating...
yandex_compute_disk.hdd[2]: Creating...
yandex_compute_disk.hdd[1]: Still creating... [10s elapsed]
yandex_compute_disk.hdd[2]: Still creating... [10s elapsed]
yandex_compute_disk.hdd[0]: Still creating... [10s elapsed]
yandex_compute_disk.hdd[1]: Creation complete after 13s [id=fhmq5u05omnorce1g3uu]
yandex_compute_disk.hdd[0]: Creation complete after 13s [id=fhmq4o2lf1enuk93l4se]
yandex_compute_disk.hdd[2]: Creation complete after 13s [id=fhm9nnpj01qch3qkb949]
yandex_compute_instance.storage: Creating...
yandex_compute_instance.storage: Still creating... [10s elapsed]
yandex_compute_instance.storage: Still creating... [20s elapsed]
yandex_compute_instance.storage: Still creating... [30s elapsed]
yandex_compute_instance.storage: Still creating... [40s elapsed]
yandex_compute_instance.storage: Creation complete after 48s [id=fhm12mn9026gggcmb6cl]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/03/src (terraform-03)$: 
```
------

### Задание 4

1. В файле ansible.tf создайте inventory-файл для ansible.
Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции.
Готовый код возьмите из демонстрации к лекции [**demonstration2**](https://github.com/netology-code/ter-homeworks/tree/main/03/demo).
Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
2. Инвентарь должен содержать 3 группы и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
3. Добавьте в инвентарь переменную  [**fqdn**](https://cloud.yandex.ru/docs/compute/concepts/network#hostname).
``` 
[webservers]
web-1 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
web-2 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[databases]
main ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
replica ansible_host<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[storage]
storage ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
```
Пример fqdn: ```web1.ru-central1.internal```(в случае указания переменной hostname(не путать с переменной name)); ```fhm8k1oojmm5lie8i22a.auto.internal```(в случае отсутвия перменной hostname - автоматическая генерация имени,  зона изменяется на auto). нужную вам переменную найдите в документации провайдера или terraform console.
4. Выполните код. Приложите скриншот получившегося файла. 

![](https://i.postimg.cc/qMTcCKDy/file.png)

![](https://i.postimg.cc/JzTjg2r5/apply.png)

![](https://i.postimg.cc/fLdXVWx8/yc-vms.png)

Для общего зачёта создайте в вашем GitHub-репозитории новую ветку terraform-03. Закоммитьте в эту ветку свой финальный код проекта, пришлите ссылку на коммит.   
**Удалите все созданные ресурсы**.



### Критерии оценки

Зачёт ставится, если:

* выполнены все задания,
* ответы даны в развёрнутой форме,
* приложены соответствующие скриншоты и файлы проекта,
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку работу отправят, если:

* задание выполнено частично или не выполнено вообще,
* в логике выполнения заданий есть противоречия и существенные недостатки. 


