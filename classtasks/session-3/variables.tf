variable "instance_type" { // variable name has to be unique within the same directory
  description = "Type of instance to create"
  type        = string // data constraint or type
  default     = "t3.micro" // default value for your variable
}

variable "key_name" { 
  description = "ssh key name for aws ec2 instance"
  type        = string 
  default     = "MyPcKey" 
}

variable "tags" {
    description = "common tags"
    type = map(string)
    default = {
        Name = "terraform-session-instance"
        Environment = "development"
    }
}

variable "env" {
    description = "environment"
    type = string
    default = "development"
}

// go with lower case only 
// use "_" instead of "-" for second labels, and variable names