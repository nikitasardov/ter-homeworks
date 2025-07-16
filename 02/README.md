# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

### Цели задания

1. Создать свои ресурсы в облаке Yandex Cloud с помощью Terraform.
2. Освоить работу с переменными Terraform.


### Чек-лист готовности к домашнему заданию

1. Зарегистрирован аккаунт в Yandex Cloud. Использован промокод на грант.
2. Установлен инструмент Yandex CLI.
3. Исходный код для выполнения задания расположен в директории [**02/src**](https://github.com/netology-code/ter-homeworks/tree/main/02/src).


### Задание 0

1. Ознакомьтесь с [документацией к security-groups в Yandex Cloud](https://cloud.yandex.ru/docs/vpc/concepts/security-groups?from=int-console-help-center-or-nav). 
Этот функционал понадобится к следующей лекции.

------
### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
------

### Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.
Убедитесь что ваша версия **Terraform** ~>1.8.4

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Создайте сервисный аккаунт и ключ. [service_account_key_file](https://terraform-provider.yandexcloud.net).
4. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную **vms_ssh_public_root_key**.
```
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdl1NLqfHSY6kh6wPj/QEKB7BZOXgZhHw9S6tgcq/GzG/UAhqYONiTi/ux3zL+psUqXphH85lZSDKEZvRFmD5YeY7zI0LsDkb39xSrGIAXCCXe3PK7PmiGSjUOKRi1kXHDPIb/+Ukvv2Z7Wn26cWP4idQbCIZ7NuHUQZh6dRpfZUCUe5WfkwqwrKxlEZT1KhhjH4GjbnTuxP1uwNJUydseNE3gVa/dzclUIn8gtnI/C+02rTE6D1UX/yKX4I9Jc4oIuNrEwXvpzi987EAOmFtpLVNGI7Xty3PSfrmfXhrp/8SMKRCAH1KCdMDxC+Hn9TRh5sVcyhb3EbH/2q0bygnB lime14@lime14-pc"
  description = "ssh-keygen -t ed25519"
}
```
5. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of yandex-cloud/yandex...
- Installing yandex-cloud/yandex v0.145.0...
- Installed yandex-cloud/yandex v0.145.0 (unauthenticated)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

╷
│ Warning: Incomplete lock file information for providers
│ 
│ Due to your customized provider installation methods, Terraform was forced to calculate lock file checksums locally for the following providers:
│   - yandex-cloud/yandex
│ 
│ The current .terraform.lock.hcl file only includes checksums for linux_amd64, so Terraform running on another platform will fail to install these providers.
│ 
│ To calculate additional checksums for another platform, run:
│   terraform providers lock -platform=linux_amd64
│ (where linux_amd64 is the platform to generate)
╵

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: 
```

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: git diff main.tf
diff --git a/02/src/main.tf b/02/src/main.tf
index 49baf60..0de3564 100644
--- a/02/src/main.tf
+++ b/02/src/main.tf
@@ -14,9 +14,9 @@ data "yandex_compute_image" "ubuntu" {
 }
 resource "yandex_compute_instance" "platform" {
   name        = "netology-develop-platform-web"
-  platform_id = "standart-v4"
+  platform_id = "standard-v1"
   resources {
-    cores         = 1
+    cores         = 2
     memory        = 1
     core_fraction = 5
   }
```
```
не существует вариант platform_id = standart-v4. Заменил на существующий standard-v1. Количество ядер 1 в этом варианте не доступно, исправил на 2.
```
```
...
Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_network.develop: Creating...
yandex_vpc_network.develop: Creation complete after 3s [id=enpc91b9ufijgou3ea44]
yandex_vpc_subnet.develop: Creating...
yandex_vpc_subnet.develop: Creation complete after 1s [id=e9bk2dpgk2nkm0ubjukt]
yandex_compute_instance.platform: Creating...
yandex_compute_instance.platform: Still creating... [10s elapsed]
yandex_compute_instance.platform: Still creating... [20s elapsed]
yandex_compute_instance.platform: Still creating... [30s elapsed]
yandex_compute_instance.platform: Still creating... [40s elapsed]
yandex_compute_instance.platform: Creation complete after 42s [id=fhm193eu86vvmofvke93]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: 
```

6. Подключитесь к консоли ВМ через ssh и выполните команду ``` curl ifconfig.me```.
Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: ```"ssh ubuntu@vm_ip_address"```. Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: ```eval $(ssh-agent) && ssh-add``` Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: ssh -l ubuntu 62.84.125.160
The authenticity of host '62.84.125.160 (62.84.125.160)' can't be established.
ECDSA key fingerprint is SHA256:wxxgsX+a+G74saq2FL3kG5xx/+qs0oaol9ZjsuC0TKA.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '62.84.125.160' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-216-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Jul 15 19:30:49 UTC 2025

  System load:  0.7               Processes:             110
  Usage of /:   37.7% of 4.20GB   Users logged in:       0
  Memory usage: 18%               IPv4 address for eth0: 10.0.1.10
  Swap usage:   0%


Expanded Security Maintenance for Infrastructure is not enabled.

0 updates can be applied immediately.

33 additional security updates can be applied with ESM Infra.
Learn more about enabling ESM Infra service for Ubuntu 20.04 at
https://ubuntu.com/20-04



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@fhm193eu86vvmofvke93:~$ curl ifconfig.me
62.84.125.160
```
7. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ.

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;

![](https://downloader.disk.yandex.ru/preview/ed4c8c94bf420298740cff17dac41c5c6726a68ca7032a04922d242d3cb150ad/6876e609/4arDOFAR33vYiva03KqiYSAvGOa-4k5RaWHU8_Rd9gQaRGSc68IIU2xyDeG_dyzCVrqDvWk-2Ap-G_yf4fmP3A%3D%3D?uid=0&filename=yc.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v3&size=2048x2048)

- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;

![](https://downloader.disk.yandex.ru/preview/9a9bc008621da74ca66235a51080403d374fcbc9ae757906efd69530d0bf70c5/6876e6b7/P3orqcTXauB-vlphms175tVIqY5fn6znI_a_EUsO0qNMD7HsxkIlR9S6xBctlRvrRZT3f9nr_hA15vDZ9Av8Wg%3D%3D?uid=0&filename=curl.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v3&size=2048x2048)

- ответы на вопросы.
```
preemptible это прерываемая ВМ. Позволяет экономить при обучении. (А еще можно с помощью этой настройки имитировать внезапное падение серверов при тестировании надежности системы.)

core_fraction так же позволяет экономить при обучении, ограничивая ресурсы процессора. ВМ с такой настройкой дешевле, но медленнее.
```

### Задание 2

1. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
```
--- a/02/src/main.tf
+++ b/02/src/main.tf
@@ -10,15 +10,15 @@ resource "yandex_vpc_subnet" "develop" {
 
 
 data "yandex_compute_image" "ubuntu" {
-  family = "ubuntu-2004-lts"
+  family = var.image_family
 }
 resource "yandex_compute_instance" "platform" {
-  name        = "netology-develop-platform-web"
-  platform_id = "standart-v4"
+  name        = var.vm_web_name
+  platform_id = var.vm_web_platform_id
   resources {
-    cores         = 1
-    memory        = 1
-    core_fraction = 5
+    cores         = var.vm_web_resources.cores
+    memory        = var.vm_web_resources.memory
+    core_fraction = var.vm_web_resources.core_fraction
   }
   boot_disk {
     initialize_params {
@@ -26,16 +26,16 @@ resource "yandex_compute_instance" "platform" {
     }
   }
   scheduling_policy {
-    preemptible = true
+    preemptible = var.vm_web_scheduling_policy_preemptible
   }
   network_interface {
     subnet_id = yandex_vpc_subnet.develop.id
-    nat       = true
+    nat       = var.vm_web_network_interface_nat
   }
 
   metadata = {
-    serial-port-enable = 1
-    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
+    serial-port-enable = var.vm_web_metadata.serial_port_enable
+    ssh-keys           = "${var.vm_web_metadata.default_user}:${var.vms_ssh_root_key}"
   }
 
 }
```

3. Проверьте terraform plan. Изменений быть не должно. 
```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: terraform plan
data.yandex_compute_image.ubuntu: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enp416tti9rvd14b8m9o]
data.yandex_compute_image.ubuntu: Read complete after 1s [id=fd88h22en6kf0uhptpk5]
yandex_vpc_subnet.develop: Refreshing state... [id=e9b7hev7gj072inh1ip0]
yandex_compute_instance.platform: Refreshing state... [id=fhmmt6t4c8i9ftuvi8t6]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: 
```

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  ```cores  = 2, memory = 2, core_fraction = 20```. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').  ВМ должна работать в зоне "ru-central1-b"
3. Примените изменения.
```
yandex_vpc_network.develop: Creating...
yandex_vpc_network.develop: Creation complete after 3s [id=enpup4ibo9frfri0oi7b]
yandex_vpc_subnet.develop: Creating...
yandex_vpc_subnet.develop_db: Creating...
yandex_vpc_subnet.develop: Creation complete after 1s [id=e9b28372pf90t767ebao]
yandex_compute_instance.platform: Creating...
yandex_vpc_subnet.develop_db: Creation complete after 1s [id=e2lmohovrj1h8fvg7lai]
yandex_compute_instance.db: Creating...
yandex_compute_instance.platform: Still creating... [10s elapsed]
yandex_compute_instance.db: Still creating... [10s elapsed]
yandex_compute_instance.platform: Still creating... [20s elapsed]
yandex_compute_instance.db: Still creating... [20s elapsed]
yandex_compute_instance.platform: Still creating... [30s elapsed]
yandex_compute_instance.db: Still creating... [30s elapsed]
yandex_compute_instance.platform: Still creating... [40s elapsed]
yandex_compute_instance.db: Still creating... [40s elapsed]
yandex_compute_instance.db: Creation complete after 41s [id=epdgej2tbkomps60t4b1]
yandex_compute_instance.platform: Creation complete after 49s [id=fhmcdnpinkcl0t8qmffj]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: 
```
![](https://downloader.disk.yandex.ru/preview/4f8c4c965d98100cf439f4e530dd59d4ef5fc4d206b4e91410609c9b27c1b36e/6877706f/i-BaICSTo_b-SszVX7-lxpArBwNNTn3SSgG84qfXr13SG2mGJHNKvPsM5wWQg_7W2SA83x7kt63sNBaoALr0qg%3D%3D?uid=0&filename=zone.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=0&tknv=v3&size=2048x2048)

### Задание 4

1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: terraform output
instances_info = {
  "db" = {
    "external_ip" = "89.169.181.245"
    "fqdn" = "epdgej2tbkomps60t4b1.auto.internal"
    "name" = "netology-develop-platform-db"
  }
  "platform" = {
    "external_ip" = "158.160.39.137"
    "fqdn" = "fhmcdnpinkcl0t8qmffj.auto.internal"
    "name" = "netology-develop-platform-web"
  }
}
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: 
```

### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
2. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
3. Примените изменения.
```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: terraform apply
data.yandex_compute_image.ubuntu: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enpup4ibo9frfri0oi7b]
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd88h22en6kf0uhptpk5]
yandex_vpc_subnet.develop_db: Refreshing state... [id=e2lmohovrj1h8fvg7lai]
yandex_vpc_subnet.develop: Refreshing state... [id=e9b28372pf90t767ebao]
yandex_compute_instance.db: Refreshing state... [id=epdgej2tbkomps60t4b1]
yandex_compute_instance.platform: Refreshing state... [id=fhmcdnpinkcl0t8qmffj]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

instances_info = {
  "db" = {
    "external_ip" = "89.169.181.245"
    "fqdn" = "epdgej2tbkomps60t4b1.auto.internal"
    "name" = "netology-develop-platform-db"
  }
  "platform" = {
    "external_ip" = "158.160.39.137"
    "fqdn" = "fhmcdnpinkcl0t8qmffj.auto.internal"
    "name" = "netology-develop-platform-web"
  }
}
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: 
```

### Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в единую map-переменную **vms_resources** и  внутри неё конфиги обеих ВМ в виде вложенного map(object).  
   ```
   пример из terraform.tfvars:
   vms_resources = {
     web={
       cores=2
       memory=2
       core_fraction=5
       hdd_size=10
       hdd_type="network-hdd"
       ...
     },
     db= {
       cores=2
       memory=4
       core_fraction=20
       hdd_size=10
       hdd_type="network-ssd"
       ...
     }
   }
   ```
3. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.
   ```
   пример из terraform.tfvars:
   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }
   ```  
  
5. Найдите и закоментируйте все, более не используемые переменные проекта.
6. Проверьте terraform plan. Изменений быть не должно.
```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$: terraform plan
data.yandex_compute_image.ubuntu: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enpup4ibo9frfri0oi7b]
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd88h22en6kf0uhptpk5]
yandex_vpc_subnet.develop: Refreshing state... [id=e9b28372pf90t767ebao]
yandex_vpc_subnet.develop_db: Refreshing state... [id=e2lmohovrj1h8fvg7lai]
yandex_compute_instance.platform: Refreshing state... [id=fhmcdnpinkcl0t8qmffj]
yandex_compute_instance.db: Refreshing state... [id=epdgej2tbkomps60t4b1]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/02/src (main)$:
```
------


### Правила приёма работы
Для подключения предварительно через ssh измените пароль пользователя: sudo passwd ubuntu
В качестве результата прикрепите ссылку на MD файл с описанием выполненой работы в вашем репозитории. Так же в репозитории должен присутсвовать ваш финальный код проекта.

**Важно. Удалите все созданные ресурсы**.


### Критерии оценки

Зачёт ставится, если:

* выполнены все задания,
* ответы даны в развёрнутой форме,
* приложены соответствующие скриншоты и файлы проекта,
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку работу отправят, если:

* задание выполнено частично или не выполнено вообще,
* в логике выполнения заданий есть противоречия и существенные недостатки. 

