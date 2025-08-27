resource "aws_instance" "main" {
    ami = data.aws_ami.amazon_linux_2023.id
    instance_type = var.instance_type // Reference to the input variable defined in variables.tf
    key_name = var.key_name 
    vpc_security_group_ids = [aws_security_group.main.id] // Reference to the security group created in sg.tf
    tags = var.tags 
    depends_on = [aws_security_group.main] // Explicit dependency to ensure security group is created first
    user_data = data.template_file.userdata.rendered

}

// How to referece to resource created in sg.tf = use attribute reference 
// Syntax: [first_label.second_label.attribute]
// By default, Terraform has implicit dependency

// How to Reference to Input Variable?
// Syntax: var.variable_name

// How to Reference to Data Source?
// Syntax: data.first_label.second_label.attribute

// modern way to use user_data with variable
# user_data = templatefile("userdata.sh"), {
#     env = var.env
# }