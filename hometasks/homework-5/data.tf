data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "aws-terraform-practice-v1"      
    key    = "homework-4-5/network/terraform.tfstate"  
    region = "us-east-2"
  }
}

locals {
  vpc_id             = data.terraform_remote_state.network.outputs.vpc_id
  public_subnet_ids  = data.terraform_remote_state.network.outputs.public_subnet_ids
  private_subnet_ids = data.terraform_remote_state.network.outputs.private_subnet_ids
}
