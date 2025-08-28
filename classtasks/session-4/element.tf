resource "aws_security_group" "main" {
  name        = "aws-session-sg"
  description = "This is a security group for an ec2 instance"

  tags = {
    Name = "${var.env}-aws-session-sg"
    Name1 = format("%s-aws-session-sg", var.env)
  }
}
resource "aws_vpc_security_group_ingress_rule" "main" {
  count = length(var.ports) 
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = var.cidr_blocks[count.index] // or cidrsubnet("10.0.0.0/16", 8, count.index)
  from_port   = element(var.ports, count.index)
  ip_protocol = "tcp"
  to_port     = var.ports[count.index]
  tags = {
    Name = format("%s-rule-%s", var.env, var.cidr_blocks[count.index])
  }  
}
resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = "10.0.0.0/8"
  ip_protocol = "-1" // All ports from 0-65535, and all protocols TCP, UDP, ICMP
}

// Scenario: I would like to have port 22, 25, 3306, 3456, 80, and 443 open

# element(list, index)

# //retreive an element form a list based on index
# //example

# element( [apple, banana, grape], 2)
# > grape

# element ([apple, banana, grape], 0)
# > apple

# element( [2,6,7,3,6,1,3,5,6,9], 5)
# > 1

# element( [2,6,7,3,6,1,3,5,6,9], 9)
# > 9

# format("Hello, %s!", "Ander")
# Hello, Ander!

# format("There are %d lights", 4)
# There are 4 lights