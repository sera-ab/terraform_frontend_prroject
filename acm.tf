resource "aws_acm_certificate" "frontend_cert" {
  domain_name       = "example.com"
  validation_method = "DNS"

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "frontend_cert" {
  certificate_arn = aws_acm_certificate.frontend_cert.arn

  validation_record_fqdns = ["]

  timeouts {
    create = "2m"
  }
}
