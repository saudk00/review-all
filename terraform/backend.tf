terraform {
  backend "s3" {
    bucket = "gha-tf-saud"
    key = "gha-statefile/terraform.tfstate"
    region = "us-east-1"
    profile = "Saud"
  }
}