resource "aws_iam_instance_profile" "access-profile" {
  name = "${var.env}-monitor-profile"
  role = aws_iam_role.access-role.name
}


resource "aws_iam_policy_attachment" "access-attachment" {
  name       = "${var.env}-monitor-attachment"
  roles      = [aws_iam_role.access-role.name]
  policy_arn = aws_iam_policy.access-policy.arn
}


resource "aws_iam_role" "access-role" {
  name = "${var.env}-monitor-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "access-policy" {
  name        = "${var.env}-policy-monitor"
  path = "/"
  policy = jsonencode({
    
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "VisualEditor1",
        "Effect": "Allow",
        "Action": "ec2:*",
        "Resource": "arn:aws:ec2:us-east-1:581798224530:vpc/*"
		}
    ]

  
  })
}

