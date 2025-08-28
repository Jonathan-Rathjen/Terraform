resource "aws_instance" "main" {
    count = 4
    ami = "ami-0b016c703b95ecbe4"
    instance_type = "t3.micro"
    key_name = "MyPcKey"
    tags = {
        Name = "${var.env}-terraform-session-instance-${count.index + 1}"
        Environment = "development"
    }
}

// "4" = string
// 4 = number

