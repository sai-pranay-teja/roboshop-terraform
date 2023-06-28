data "aws_ami" "centos-ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

data "aws_ssm_parameter" "user" {
  depends_on = [ aws_ssm_parameter.parameters ]
  name = "${var.env}.jenkins-ssh.user"
}

data "aws_ssm_parameter" "pass" {
  depends_on = [ aws_ssm_parameter.parameters ]
  name = "${var.env}.jenkins-ssh.pass"
}

data "aws_route53_zone" "mine" {
  name         = "${var.domain_name}"
}

data "aws_caller_identity" "current" {}
