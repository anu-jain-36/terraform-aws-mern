
variable "project_name" {}
variable "cluster_name" {}
variable "aws_region" {}
variable "vpc_id" {}
variable "vpc_cidr_block" {}

provider "mongodbatlas" {}

resource "mongodbatlas_project" "this" {
  name = var.project_name
}

resource "mongodbatlas_cluster" "this" {
  project_id   = mongodbatlas_project.this.id
  name         = var.cluster_name
  provider_name = "AWS"
  provider_region_name = var.aws_region
  provider_instance_size_name = "M10"
}

resource "mongodbatlas_network_container" "this" {
  project_id = mongodbatlas_project.this.id
  atlas_cidr_block = "192.168.0.0/21"
  provider_name = "AWS"
  region_name = var.aws_region
}

resource "mongodbatlas_network_peering" "this" {
  project_id         = mongodbatlas_project.this.id
  container_id       = mongodbatlas_network_container.this.container_id
  provider_name      = "AWS"
  accepter_region_name = var.aws_region

  vpc_id       = var.vpc_id
  route_table_cidr_block = var.vpc_cidr_block
  aws_account_id = "123456789012"
}

output "connection_string" {
  value = mongodbatlas_cluster.this.connection_strings[0].standard_srv
}
