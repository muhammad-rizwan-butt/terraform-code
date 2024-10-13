module "shared_vpc" {
  source = "./modules/10-vpc"

  vpc_name       = local.json_data.vpc_name
  ipam_pool_id   = local.json_data.ipam_pool_id
  vpc_cidr_block = local.json_data.vpc_cidr_block
}

module "subnets" {
  source = "./modules/20-subnets"
  depends_on = [
    module.shared_vpc
  ]

  vpc_id                 = module.shared_vpc.vpc_id
  public_nacl_id         = module.shared_vpc.public_nacl_id
  private_nacl_id        = module.shared_vpc.private_nacl_id
  public_route_table_id  = module.shared_vpc.public_route_table_id
  private_route_table_id = module.shared_vpc.private_route_table_id

  ipam_pool_id = local.json_data.ipam_pool_id
  subnet_data  = local.json_data.subnets
}

output "subnets" {
  value = module.subnets.subnets
}