module "ec2" {
  source        = "../../modules/ec2" // path to module (can call them locally or remotely)
  ####################### Input Variables ########################
  ami           = "ami-0b016c703b95ecbe4" 
  instance_type = "t2.micro"
  env           = "dev"
  vpc_security_group_ids = [module.sg.security_group_id] // Reference to security group module output // Syntax: module.<MODULE NAME>.<OUTPUT NAME>
}

module "sg" {
  source      = "../../modules/sg" 
  name        = "dev-sg"
  description = "Security group for dev environment"
}

// How to reference to a child module's output value

module "kris_ec2" {
  source = "github.com/aKumoSolutions/apr2025-terraform-session/classtask/modules/ec2?ref=v1.0.0" // Where the child module is. You can call child modules locally or remotely
############## Input Variables ##################
  ami = "ami-01102c5e8ab69fb75"
  instance_type = "t3.micro"
  env = "dev"
  vpc_security_group_ids = [ module.sg.security_group_id ] // Reference to child module outputs // Syntax: module.module_name.output
}

module "kris_sg" {
  source = "github.com/aKumoSolutions/apr2025-terraform-session/classtask/modules/sg?ref=v1.0.0"
############## Input Variables ##################
  name = "terraform-module-sg-main"
  description = "This is a security group for terraform instance"
}

# github.com = platform
# /aKumoSolutions = organization
# /apr2025-terraform-session = repository
# /tree = branch
# /main = branch
# /classtask = folder (subdir)
# /modules = subdir
# /ec2 = subdir

// Terraform always looks intoi a default branch called "main" unless specified otherwise.