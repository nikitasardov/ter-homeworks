locals {
  project = "netology"
  env     = "develop"

  web_instance_name = "${local.project}-${local.env}-platform-web"
  db_instance_name  = "${local.project}-${local.env}-platform-db"
}