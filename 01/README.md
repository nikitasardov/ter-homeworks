# Домашнее задание к занятию «Введение в Terraform»

### Чек-лист готовности к домашнему заданию

1. Скачайте и установите **Terraform** версии >=1.8.4 . Приложите скриншот вывода команды ```terraform --version```.

```
ai@ai:/var/www/study/netology/devops/devops-netology (master)$: mv terraform /usr/bin/terraform
mv: cannot move 'terraform' to '/usr/bin/terraform': Permission denied
ai@ai:/var/www/study/netology/devops/devops-netology (master)$: sudo mv terraform /usr/bin/terraform
[sudo] password for ai: 
ai@ai:/var/www/study/netology/devops/devops-netology (master)$: chmod +x /usr/bin/terraform 
ai@ai:/var/www/study/netology/devops/devops-netology (master)$: ls -la /usr/bin/terraform 
-rwxr-xr-x 1 ai ai 88207512 мая 22  2024 /usr/bin/terraform
ai@ai:/var/www/study/netology/devops/devops-netology (master)$: terraform --version
Terraform v1.8.4
on linux_amd64
ai@ai:/var/www/study/netology/devops/devops-netology (master)$:
```

2. Скачайте на свой ПК этот git-репозиторий (https://github.com/netology-code/ter-homeworks/blob/main/01/hw-01.md). Исходный код для выполнения задания расположен в директории **01/src**.

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: ls -la
total 20
drwxrwxr-x 2 ai ai 4096 июл 15 06:37 .
drwxrwxr-x 4 ai ai 4096 июл 15 06:37 ..
-rw-rw-r-- 1 ai ai  170 июл 15 06:37 .gitignore
-rw-rw-r-- 1 ai ai  757 июл 15 06:37 main.tf
-rw-rw-r-- 1 ai ai  205 июл 15 06:37 .terraformrc
```

3. Убедитесь, что в вашей ОС установлен docker.

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: docker --version
Docker version 28.1.1, build 4eba377
```

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте. 

```
Terraform и docker установлены

ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: cp .terraformrc ~/
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: ls -la ~/.terraform
ls: cannot access '/home/ai/.terraform': No such file or directory
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: ls -la ~/.terraformrc
-rw-rw-r-- 1 ai ai 205 июл 15 07:02 /home/ai/.terraformrc
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: 

ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: terraform init

Initializing the backend...

Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "~> 3.0.1"...
- Finding latest version of hashicorp/random...
- Installing kreuzwerker/docker v3.0.2...
- Installed kreuzwerker/docker v3.0.2 (unauthenticated)
- Installing hashicorp/random v3.7.2...
- Installed hashicorp/random v3.7.2 (unauthenticated)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

╷
│ Warning: Incomplete lock file information for providers
│ 
│ Due to your customized provider installation methods, Terraform was forced to calculate lock file checksums locally for the following providers:
│   - hashicorp/random
│   - kreuzwerker/docker
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
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: 
```


2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)

```
git будет игнорировать файл personal.auto.tfvars, поэтому личную и секретную информацию можно хранить в нем
```

3. Выполните код проекта. Найдите  в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: terraform validate
Success! The configuration is valid.
```

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_password.random_string will be created
  + resource "random_password" "random_string" {
      + bcrypt_hash = (sensitive value)
      + id          = (known after apply)
      + length      = 16
      + lower       = true
      + min_lower   = 1
      + min_numeric = 1
      + min_special = 0
      + min_upper   = 1
      + number      = true
      + numeric     = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: 
```

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_password.random_string will be created
  + resource "random_password" "random_string" {
      + bcrypt_hash = (sensitive value)
      + id          = (known after apply)
      + length      = 16
      + lower       = true
      + min_lower   = 1
      + min_numeric = 1
      + min_special = 0
      + min_upper   = 1
      + number      = true
      + numeric     = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_password.random_string: Creating...
random_password.random_string: Creation complete after 0s [id=none]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$:
```

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: cat terraform.tfstate | grep result
            "result": "p4X9f6abO0SeclTU",
                "value": "result"
  "check_results": null
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: 
```

```
ОТВЕТ:
"result": "p4X9f6abO0SeclTU"
```

4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: terraform validate
╷
│ Error: Missing name for resource
│ 
│   on main.tf line 24, in resource "docker_image":
│   24: resource "docker_image" {
│ 
│ All resource blocks must have 2 labels (type, name).
╵
╷
│ Error: Invalid resource name
│ 
│   on main.tf line 29, in resource "docker_container" "1nginx":
│   29: resource "docker_container" "1nginx" {
│ 
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.
╵
```

```
1. У ресурса должно быть имя
2. Имя ресурса не может начинаться с цифры
3. random_string_FAKE не объявленный ресурс
```

5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.

```
ИСПРАВЛЕНО:
...
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}
...
```

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: terraform validate
Success! The configuration is valid.

ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: 
```

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                  NAMES
fc5e8783656d   22bd15417453   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:9090->80/tcp   example_p4X9f6abO0SeclTU
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: 
```

6. Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды ```docker ps```.

```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "hello_world"

  ports {
    internal = 80
    external = 9090
  }
}
```

```
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                  NAMES
5af0db8bd653   22bd15417453   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:9090->80/tcp   hello_world
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: 
```

```
Опасность применения ключа  -auto-approve в том, что при его использовании нет возможности проверить план изменений перед применением. Так можно удалить или заменить критически важные ресурсы. 

Этот ключ будет полезен в автоматизированных CI/CD пайплайнах, при автоматическом развертывании тестовых сред, когда изменения точно известны и безопасны
```

7. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**. 

```
...
Plan: 0 to add, 0 to change, 3 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

random_password.random_string: Destroying... [id=none]
docker_container.nginx: Destroying... [id=5af0db8bd653fa8e4b14059e12479e56ce2c8d4eb3b50633355f4c27eef0746f]
random_password.random_string: Destruction complete after 0s
docker_container.nginx: Destruction complete after 0s
docker_image.nginx: Destroying... [id=sha256:22bd1541745359072c06a72a23f4f6c52dbb685424e0d5b29008ae4eb2683698nginx:latest]
docker_image.nginx: Destruction complete after 0s

Destroy complete! Resources: 3 destroyed.
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: 
```

```
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: cat terraform.tfstate
{
  "version": 4,
  "terraform_version": "1.8.4",
  "serial": 11,
  "lineage": "f1aa27fa-70f6-f5cb-c93b-0e3e6714525f",
  "outputs": {},
  "resources": [],
  "check_results": null
}
ai@ai:/var/www/study/netology/devops/devops-netology/cloud-infr-hw/ter-homeworks/01/src (main)$: 
```

8. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ**, а затем **ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ** строчкой из документации [**terraform провайдера docker**](https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs).  (ищите в классификаторе resource docker_image )

```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}
```

```
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
```

```
Если keep_locally = true, то образ не будет удален при выполнении terraform destroy
```
------

### Правила приёма работы

Домашняя работа оформляется в отдельном GitHub-репозитории в файле README.md.   
Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

