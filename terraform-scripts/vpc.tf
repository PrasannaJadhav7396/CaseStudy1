module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.0"

  name = "vpc-module-nodejs"
  cidr = "10.0.0.0/16"

  # azs             = slice(data.aws_availability_zones.available.names, 0, 1)
  azs             = ["us-east-1a","us-east-1b"]
  private_subnets = ["10.0.3.0/24"]
  public_subnets  = ["10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Name = "${var.cluster-name}-vpc"
  }
}
