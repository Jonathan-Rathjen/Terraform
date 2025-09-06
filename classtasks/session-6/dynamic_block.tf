resource "aws_security_group" "main" {
  name        = "aws-session-sg"
  description = "This is a security group for an ec2 instance"

  dynamic "ingress"{
    for_each = var.inbound_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "inbound_rules" {
  description = "List of inbound rules for the security group"
  type = list(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.1/32"]
    },
    {
      port        = 443
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.2/32"]
    },
    {
      port        = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.3/32"]
    }
  ]
}