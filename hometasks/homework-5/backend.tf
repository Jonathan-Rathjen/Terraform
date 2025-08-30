terraform {
    backend "s3" {
        bucket = "aws-terraform-practice-v1"
        key = "homework-4-5/application/terraform.tfstate"
        region = "us-east-2"
        encrypt = true

    }
}