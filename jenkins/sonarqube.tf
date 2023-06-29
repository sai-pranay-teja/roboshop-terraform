provider "aws" {
    region = "us-east-1"
  
}

resource "aws_route53_record" "sonarqube_dns" {
  allow_overwrite = true
  name            = "${var.env}-sonarqube.${var.domain_name}"
  ttl             = 30
  type            = "A"
  zone_id         = data.aws_route53_zone.mine.zone_id

  records = [aws_spot_instance_request.sonarqube.public_ip]
}

resource "aws_spot_instance_request" "sonarqube" {
  ami           = data.aws_ami.centos-ami.id
  instance_type = var.sonarqube["instance_type"]
  vpc_security_group_ids = [ aws_security_group.all_traffic.id ]
  wait_for_fulfillment="true"
  spot_type="persistent"
  associate_public_ip_address = true
  instance_interruption_behavior="stop"

  tags = {
        Name = var.sonarqube["Name"]
    }

  timeouts {
    create = "60m"
    delete = "2h"
  }
} 

resource "aws_ec2_tag" "component-tags" {
    resource_id = aws_spot_instance_request.sonarqube.spot_instance_id
    key         = "Name"
    value       = "${var.env}-sonarqube"
}

resource "null_resource" "resource-creation" {
  depends_on = [ aws_spot_instance_request.sonarqube ]
    provisioner "remote-exec" {
    connection {
      host = aws_spot_instance_request.sonarqube.public_ip
      user = data.aws_ssm_parameter.user.value
      password = data.aws_ssm_parameter.pass.value
    }
    inline=[
        "sudo labauto sonarqube"
    ]  



      
}

  
}
