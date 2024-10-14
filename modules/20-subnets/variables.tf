variable "vpc_id" {
  type = string
}
variable "ipam_pool_id" {
  type = string
}

variable "subnet_data" {
  type = list(object({
    name               = string
    subnet_size        = string
    type               = string
    target_aws_account = number
  }))
}

variable "public_nacl_id" {
  type = string
}

variable "private_nacl_id" {
  type = string
}

variable "public_route_table_id" {
  type = string
}

variable "private_route_table_id" {
  type = list(string)
}
