data "aws_ami" "centos-ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

data "aws_ssm_parameter" "user" {
  name = "${var.env}.ssh.user"
}

data "aws_ssm_parameter" "pass" {
  name = "${var.env}.ssh.pass"
}