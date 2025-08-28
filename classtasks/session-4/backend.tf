terraform {
    backend "s3" {
        bucket = "aws-terraform-practice-v1"
        key = "session-4/terraform.tfstate"
        region = "us-east-2"
        encrypt = true
    }
}

# "true" = string
# true = boolean