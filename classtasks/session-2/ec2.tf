resource "aws_instance" "main" {
    ami = "ami-0b016c703b95ecbe4"
    instance_type = "t3.micro"
    key_name = "MyPcKey"
    tags = {
        Name = "terraform-session-instance"
        Environment = "development"
    }
}

// resource block = create and manage resources
// aws_instance = first_label, indicates the resource that you want to interact with, defined by Terraform provider
// example = second_label, logical id or logical name of the resource, defined by me (Must be unique within the working directory)
// argument = key value pairs, configurations of the resource
// "" = string
// {} = map