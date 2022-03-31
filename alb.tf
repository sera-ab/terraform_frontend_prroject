resource "aws_lb" "frontend_lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group
  subnets            = var.alb_subnet_id
  enable_deletion_protection = true
  idle_timeout    = var.idle_timeout

  # tags = var.tags_map

#   access_logs {
#     bucket  = var.lb_logs_s3_bucket
#     prefix  = var.app_name
#     enabled = true
#   }
 }

resource "aws_alb_target_group" "frontend_lb" {
  name     = var.lb_name
  vpc_id   = var.vpc_id
  port     = 80
  protocol = "HTTP"

  health_check {
    path                = var.health_check_path
    matcher             = var.health_check_matcher
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy
    unhealthy_threshold = var.health_check_unhealthy
  }

  stickiness {
    enabled         = var.stickiness
    type            = "lb_cookie"
    cookie_duration = var.sticky_ttl
  }
  depends_on = [aws_lb.frontend_lb]
}
