resource "aws_iam_instance_profile" "access-profile" {
  name = "${var.env}-jenkins-profile"
  role = aws_iam_role.access-role.name
}


resource "aws_iam_policy_attachment" "access-attachment" {
  name       = "${var.env}-jenkins-attachment"
  roles      = [aws_iam_role.access-role.name]
  policy_arn = aws_iam_policy.access-policy.arn
}


resource "aws_iam_role" "access-role" {
  name = "${var.env}-jenkins-role"

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
  name        = "${var.env}-policy-jenkins"
  path = "/"
  policy = jsonencode(
    {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
        "ssm:*",
        "ssm:PutParameter"

      ]
			"Resource": [
				"arn:aws:ec2:*:581798224530:instance/*",
				"arn:aws:ssm:us-east-1:581798224530:parameter/*"
			]
		}
	]
}
  )
}

