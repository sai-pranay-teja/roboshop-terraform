data "aws_ami" "centos-ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

data "aws_ssm_parameter" "user" {
  name = "${var.env}.jenkins_ssh.user"
}

data "aws_ssm_parameter" "pass" {
  name = "${var.env}.jenkins_ssh.pass"
}

data "aws_route53_zone" "mine" {
  name         = "${var.domain_name}"
}