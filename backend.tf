terraform {
  backend "s3" {
    bucket         = "terraform-state-poc-25"
    key            = "poc25/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
