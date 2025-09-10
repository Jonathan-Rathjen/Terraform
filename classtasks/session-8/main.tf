resource aws_key_pair main {
  key_name   = "JonathanPCKey"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_security_group" "main" {
    name = "terraform_session-8-sg"
    description = "This is a security group for Session-8"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "main" {
    ami = "ami-0b016c703b95ecbe4"
    instance_type = "t2.micro"
    key_name = aws_key_pair.main.key_name
    vpc_security_group_ids = [aws_security_group.main.id]

provisioner "file" {
    source = "index.html" // path where the file is located on my local machine
    destination = "/tmp/index.html" // path where the file will be copied to on the remote machine
    }
    connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip // Public IP of your instance
        private_key = file("~/.ssh/id_rsa")
    }
    provisioner "remote-exec" {
        inline = [
            "sudo dnf install httpd -y",
            "sudo systemctl enable httpd",
            "sudo systemctl start httpd",
            "sudo cp /tmp/index.html /var/www/html/index.html"
        ]
        connection {
            type = "ssh"
            user = "ec2-user" 
            host = self.public_ip // Public IP of your instance
            private_key = file("~/.ssh/id_rsa")
        }
    }
}

resource "aws_s3_bucket" "main" {
  bucket = "terraform-session-8-bucket-jonathan"
}

resource "null_resource" "upload" {
  provisioner "local-exec" {
    command = "aws s3 cp ssn.txt s3://${aws_s3_bucket.main.bucket}/ssn.txt"
  }
}
resource "null_resource" "main" {
  provisioner "local-exec" {
    command = "echo 'testing local exec provisioner' >> test.txt"
  }
}