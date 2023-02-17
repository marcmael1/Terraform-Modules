module "vpc" {

  source   = "../modules/aws_vpc"
  vpc_cidr = var.vpc_cidr
  tags     = var.vpc_tags
}

module "internet_gateway" {

  source = "../modules/aws_igw"
  vpc_id = module.vpc.vpc_id
  tags   = var.igw_tags
}

module "subnet0" {

  source                  = "../modules/aws_subnet"
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr             = var.subnet_cidr0
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availibility_zone       = var.availibility_zone0

  tags = var.subnet0_tags
}

module "subnet1" {

  source                  = "../modules/aws_subnet"
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr             = var.subnet_cidr1
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availibility_zone       = var.availibility_zone1

  tags = var.subnet1_tags
}

module "subnet2" {

  source                  = "../modules/aws_subnet"
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr             = var.subnet_cidr2
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availibility_zone       = var.availibility_zone2

  tags = var.subnet2_tags
}

module "subnet3" {

  source                  = "../modules/aws_subnet"
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr             = var.subnet_cidr3
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availibility_zone       = var.availibility_zone3

  tags = var.subnet3_tags
}

module "subnet4" {

  source                  = "../modules/aws_subnet"
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr             = var.subnet_cidr4
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availibility_zone       = var.availibility_zone4

  tags = var.subnet4_tags
}

module "subnet5" {

  source                  = "../modules/aws_subnet"
  vpc_id                  = module.vpc.vpc_id
  subnet_cidr             = var.subnet_cidr5
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availibility_zone       = var.availibility_zone5

  tags = var.subnet5_tags
}

module "ngw0" {
  source    = "../modules/aws_ngw"
  subnet_id = module.subnet0.subnet_id
  tags      = var.ngw0_tags
}

module "ngw1" {
  source    = "../modules/aws_ngw"
  subnet_id = module.subnet1.subnet_id
  tags      = var.ngw1_tags
}

module "public-rt" {
  source     = "../modules/aws_rt"
  vpc_id     = module.vpc.vpc_id
  route_cidr = var.route_cidr
  gateway_id = module.internet_gateway.gateway_id
  tags       = var.public-rt_tags
}



module "private-rt0" {
  source     = "../modules/aws_rt"
  vpc_id     = module.vpc.vpc_id
  route_cidr = var.route_cidr
  gateway_id = module.ngw0.gateway_id
  tags       = var.private-rt0_tags
}

module "private-rt1" {
  source     = "../modules/aws_rt"
  vpc_id     = module.vpc.vpc_id
  route_cidr = var.route_cidr
  gateway_id = module.ngw1.gateway_id
  tags       = var.private-rt1_tags
}

module "private-rt2" {
  source     = "../modules/aws_rt"
  vpc_id     = module.vpc.vpc_id
  route_cidr = var.route_cidr
  gateway_id = module.ngw0.gateway_id
  tags       = var.private-rt2_tags
}

module "private-rt3" {
  source     = "../modules/aws_rt"
  vpc_id     = module.vpc.vpc_id
  route_cidr = var.route_cidr
  gateway_id = module.ngw1.gateway_id
  tags       = var.private-rt3_tags
}

module "aws_route_table_associations0" {
  source         = "../modules/aws_rt_association"
  subnet_id      = module.subnet0.subnet_id
  route_table_id = module.public-rt.route_table_id
}

module "aws_route_table_associations1" {
  source         = "../modules/aws_rt_association"
  subnet_id      = module.subnet1.subnet_id
  route_table_id = module.public-rt.route_table_id
}

module "aws_route_table_associations2" {
  source         = "../modules/aws_rt_association"
  subnet_id      = module.subnet2.subnet_id
  route_table_id = module.private-rt0.route_table_id
}

module "aws_route_table_associations3" {
  source         = "../modules/aws_rt_association"
  subnet_id      = module.subnet3.subnet_id
  route_table_id = module.private-rt1.route_table_id
}

module "aws_route_table_associations4" {
  source         = "../modules/aws_rt_association"
  subnet_id      = module.subnet4.subnet_id
  route_table_id = module.private-rt2.route_table_id
}

module "aws_route_table_associations5" {
  source         = "../modules/aws_rt_association"
  subnet_id      = module.subnet5.subnet_id
  route_table_id = module.private-rt3.route_table_id
}
