terraform {
  required_version = "~> 1.13.0" // Terraform version
  required_providers { // Provider Version
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.10.0"
    }
  }
}