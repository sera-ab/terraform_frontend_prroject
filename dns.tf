resource "aws_route53_record" "frontend_cname" {
  zone_id = var.source_zone_id
  name    = "yes.example.com"
  type    = "CNAME"
  ttl     = 300
  records =  [aws_lb.frontend_lb.dns_name]
}
