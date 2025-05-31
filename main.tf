terraform {
  backend "gcs" {
    bucket = "deep-dispatch-461319-i9-bucket-07d5aade"
    prefix = "terraform/state"
  }
}

module "vpc_firewall" {
  source           = "./modules/vpc-firewall"
  project          = var.project
  region           = var.region
  allowed_ip_range = var.allowed_ip_range
}

