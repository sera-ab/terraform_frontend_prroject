
resource "aws_autoscaling_group" "frontend_web_asg" {
  name                 = "frontend_web_asg"
  launch_configuration = aws_launch_configuration.asg_conf.name
  # vpc_zone_identifier       = var.vpc_zone_identifier
  availability_zones = ["eu-west-1c"]
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true
  # initial_lifecycle_hook {
  #   name                 = "foobar"
  #   default_result       = "CONTINUE"
  #   heartbeat_timeout    = 2000
  #   lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
  #}  
    
    timeouts {
    delete = "15m"
  }
  target_group_arns = [aws_alb_target_group.frontend_lb.arn]
  
  
  
  
  resource "aws_launch_configuration" "asg_conf" {
  name          = "frontend_web_asg"
  image_id      = data.aws_ami.ami.id
  instance_type = "t2.micro"
  security_groups      = var.security_group
}
