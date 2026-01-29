
module "mongo" {
  source          = "../../modules/mongo_atlas"
  project_name    = "mern-dev"
  cluster_name    = "mern-dev-cluster"
  aws_region      = "AP_SOUTH_1"
  vpc_id          = module.vpc.vpc_id
  vpc_cidr_block  = "10.0.0.0/16"
}
