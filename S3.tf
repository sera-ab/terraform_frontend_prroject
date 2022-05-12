resource "aws_s3_bucket" "some_bucket" {
  bucket = "my-bucket-name"
  force_destroy = true
}

resource "aws_iam_policy" "bucket_policy" {
  name        = "my-bucket-policy"
  path        = "/"
  description = "Allow "

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        "Resource" : [
          "arn:aws:s3:::/",
          "arn:aws:s3:::my-bucket-name"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "role" {
  name = "my_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "*"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "bucket_policy" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.bucket_policy.arn
}
