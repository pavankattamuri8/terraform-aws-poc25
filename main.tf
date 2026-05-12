module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

module "ec2" {
  source     = "./modules/ec2"
  ami_id    = var.ami_id
  subnet_id = module.vpc.subnet_id
  vpc_id    = module.vpc.vpc_id
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "poc25-app-bucket-mumbai-123"
}
