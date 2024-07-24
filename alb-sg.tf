
# Create a security group for ALB

resource "aws_security_group" "alb_sg" {
  name        = "alb-security-group"
  description = "Application load balancer security group"
  vpc_id      = aws_vpc.alb_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }

  tags = {
    Name = "alb-security-group"
  }
}
