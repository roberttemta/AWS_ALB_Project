
# Create a target group
resource "aws_lb_target_group" "alb-target-group" {
  name     = "application-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.alb_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    unhealthy_threshold = 3
  }
}

# Attach the target group to the AWS instances
resource "aws_lb_target_group_attachment" "attach-app" {
  count            = length(aws_instance.web-server)
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = element(aws_instance.web-server.*.id, count.index)
  port             = 80
}
