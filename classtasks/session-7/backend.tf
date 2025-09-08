terraform {
  backend "s3" {
    bucket  = "aws-terraform-practice-v1"
    key     = "session-7/_env_/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}

// varibles cannot be defined in backend.tf file
