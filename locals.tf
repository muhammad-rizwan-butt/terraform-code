locals {
  json_data = jsondecode(file("${path.module}/config.json"))
}
