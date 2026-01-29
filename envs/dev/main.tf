
terraform {
  backend "s3" {
    bucket = "mern-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}

module "vpc" {
  source = "../../modules/vpc"
}

module "ecs" {
  source     = "../../modules/ecs"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}
