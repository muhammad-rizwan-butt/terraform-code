resource "aws_ram_resource_share" "subnet_share_1a" {
  count = length(var.subnet_data)
  name  = "${var.subnet_data[count.index].name}-1a"

  allow_external_principals = true

  tags = {
    Name = "${var.subnet_data[count.index].name}-1a"
  }
}

resource "aws_ram_principal_association" "ram_association_1a" {
  depends_on = [
    aws_ram_resource_share.subnet_share_1a
  ]
  count              = length(var.subnet_data)
  resource_share_arn = aws_ram_resource_share.subnet_share_1a[count.index].arn
  principal          = var.subnet_data[count.index].target_aws_account
}

resource "aws_ram_resource_association" "associate_subnets_1a" {
  depends_on = [
    aws_ram_resource_share.subnet_share_1a
  ]
  count              = length(var.subnet_data)
  resource_share_arn = aws_ram_resource_share.subnet_share_1a[count.index].arn
  resource_arn       = aws_subnet.subnets_1a[count.index].arn
}

resource "aws_ram_resource_share" "subnet_share_1b" {
  count = length(var.subnet_data)
  name  = "${var.subnet_data[count.index].name}-1b"

  allow_external_principals = true

  tags = {
    Name = "${var.subnet_data[count.index].name}-1b"
  }
}

resource "aws_ram_principal_association" "ram_association_1b" {
  depends_on = [
    aws_ram_resource_share.subnet_share_1b
  ]
  count              = length(var.subnet_data)
  resource_share_arn = aws_ram_resource_share.subnet_share_1b[count.index].arn
  principal          = var.subnet_data[count.index].target_aws_account
}

resource "aws_ram_resource_association" "associate_subnets_1b" {
  depends_on = [
    aws_ram_principal_association.ram_association_1b
  ]
  count              = length(var.subnet_data)
  resource_share_arn = aws_ram_resource_share.subnet_share_1b[count.index].arn
  resource_arn       = aws_subnet.subnets_1b[count.index].arn
}

resource "aws_ram_resource_share" "subnet_share_1c" {
  count = length(var.subnet_data)
  name  = "${var.subnet_data[count.index].name}-1c"

  allow_external_principals = true

  tags = {
    Name = "${var.subnet_data[count.index].name}-1c"
  }
}

resource "aws_ram_principal_association" "ram_association_1c" {
  depends_on = [
    aws_ram_resource_share.subnet_share_1c
  ]
  count              = length(var.subnet_data)
  resource_share_arn = aws_ram_resource_share.subnet_share_1c[count.index].arn
  principal          = var.subnet_data[count.index].target_aws_account
}

resource "aws_ram_resource_association" "associate_subnets_1c" {
  depends_on = [
    aws_ram_principal_association.ram_association_1c
  ]
  count              = length(var.subnet_data)
  resource_share_arn = aws_ram_resource_share.subnet_share_1c[count.index].arn
  resource_arn       = aws_subnet.subnets_1c[count.index].arn
}
