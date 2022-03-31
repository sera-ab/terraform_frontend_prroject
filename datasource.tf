data "aws_ami" "ami"{
    most_recent = true
    name_regex = "^base_123456"
    owners = [ "self" ]
}

# data "aws_lb" "target" {
#     arn = var.target_alb_arn
# }
