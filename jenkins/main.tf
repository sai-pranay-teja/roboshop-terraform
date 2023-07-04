provider "aws" {
    region = "us-east-1"
  
}

resource "aws_route53_record" "jenkins_dns" {
  allow_overwrite = true
  name            = "${var.env}-jenkins.${var.domain_name}"
  ttl             = 30
  type            = "A"
  zone_id         = data.aws_route53_zone.mine.zone_id

  records = [aws_spot_instance_request.jenkins.public_ip]
}

resource "aws_spot_instance_request" "jenkins" {
  ami           = data.aws_ami.centos-ami.id
  instance_type = var.jenkins["instance_type"]
  vpc_security_group_ids = [ aws_security_group.all_traffic.id ]
  wait_for_fulfillment="true"
  spot_type="persistent"
  iam_instance_profile = aws_iam_instance_profile.access-profile.name
  associate_public_ip_address = true
  instance_interruption_behavior="stop"
  subnet_id = "subnet-091b2024261b704f3"

  tags = {
        Name = var.jenkins["Name"]
    }

  timeouts {
    create = "60m"
    delete = "2h"
  }
} 

resource "aws_ec2_tag" "component-tags" {
    resource_id = aws_spot_instance_request.jenkins.spot_instance_id
    key         = "Name"
    value       = "${var.env}-jenkins"
}

resource "null_resource" "resource-creation" {
  depends_on = [ aws_spot_instance_request.jenkins ]
    provisioner "remote-exec" {
    connection {
      host = aws_spot_instance_request.jenkins.public_ip
      user = data.aws_ssm_parameter.user.value
      password = data.aws_ssm_parameter.pass.value
    }
    inline=[
        "sudo labauto terraform",
        "sudo labauto jenkins",
        "ssh-keygen"
        #"sudo labauto sonar-scanner",
        #"sudo labauto ansible"
    ]  



      
}

  
}
