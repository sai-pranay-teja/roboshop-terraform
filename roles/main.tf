resource "aws_iam_instance_profile" "Full-access-profile" {
  name = "Full-access-profile"
  role = aws_iam_role.role.name
}



resource "aws_iam_role" "role" {
  name               = "Full-access"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}