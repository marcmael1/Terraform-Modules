region ="us-east-1"
profile = "marc"
Automation = "terraform"
project-name = "rentzone"
env_code = "dev"

#vpc
vpc_cidr ="10.0.0.0/16"
vpc_tags = {
    Name = "VPC"
}

#internet gateway
igw_tags = {
    Name = "igw"
}

#subnet
subnet_cidr0 = "10.0.0.0/24"
availibility_zone0 =  "us-east-1a"
map_public_ip_on_launch = "true"
subnet0_tags = {
    Name = "public-subnet0"
}

subnet_cidr1 = "10.0.1.0/24"
availibility_zone1 = "us-east-1b"
subnet1_tags = {
    Name = "public-subnet1"
}

subnet_cidr2 = "10.0.2.0/24"
availibility_zone2 = "us-east-1a"
subnet2_tags = {
    Name = "private-app-subnet0"
}

subnet_cidr3 = "10.0.3.0/24"
availibility_zone3 = "us-east-1b"
subnet3_tags = {
    Name = "private-app-subnet1"
}

subnet_cidr4 = "10.0.4.0/24"
availibility_zone4 = "us-east-1a"
subnet4_tags = {
    Name = "private-db-subnet0"
}

subnet_cidr5 = "10.0.5.0/24"
availibility_zone5 = "us-east-1b"
subnet5_tags = {
    Name = "private-db-subnet1"
}

ngw0_tags = {
    Name = "ngw0"
}

ngw1_tags = {
    Name = "ngw1"
}

route_cidr = "0.0.0.0/0"
public-rt_tags = {
    Name = "public-rt"
}

private-rt0_tags = {
    Name = "private-app-rt0"
}

private-rt1_tags = {
    Name = "private-app-rt1"
}

private-rt2_tags = {
    Name = "private-db-rt0"
}

private-rt3_tags = {
    Name = "private-db-rt1"
}