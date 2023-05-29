resource "aws_iam_instance_profile" "Full-access-profile" {
  name = "Full-access-profile"
  role = aws_iam_role.full-access-role.name
}


resource "aws_iam_policy_attachment" "full-access-attachment" {
  name       = "Full-access-attachment"
  roles      = [aws_iam_role.full-access-role.name]
  policy_arn = aws_iam_policy.full-access-policy.arn
}


resource "aws_iam_role" "full-access-role" {
  name = "Full-access-role"

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

resource "aws_iam_policy" "full-access-policy" {
  name        = "full_access"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = [

 "*" ]
      },
    ]
  })
}

