terraform {
  backend "s3" {
    bucket  = "aws-terraform-practice-v1"
    key     = "jerry/dev/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}