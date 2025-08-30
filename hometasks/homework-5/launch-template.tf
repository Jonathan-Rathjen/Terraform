# 1. Security Group for EC2
resource "aws_security_group" "web_lt_sg" {
  name        = "web-lt-sg"
  description = "Security group for EC2 in Launch Template"
  vpc_id      = local.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-lt-sg"
  }
}

# 2. Launch Template using user_data file
resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt-"
  image_id      = "ami-096566f39a31a283e"
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                  = local.private_subnet_ids[0]
    security_groups             = [aws_security_group.web_lt_sg.id]
  }

  user_data = base64encode(file("${path.module}/setup_httpd.sh"))
}

# 3. Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  name                      = "web-asg"
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 2
  vpc_zone_identifier       = local.private_subnet_ids

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_tg.arn]

  health_check_type         = "EC2"
  health_check_grace_period = 60

  force_delete = true

  tag {
    key                 = "Name"
    value               = "web-asg"
    propagate_at_launch = true
  }
}
