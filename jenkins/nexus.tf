

resource "aws_route53_record" "nexus_dns" {
  allow_overwrite = true
  name            = "${var.env}-nexus.${var.domain_name}"
  ttl             = 30
  type            = "A"
  zone_id         = data.aws_route53_zone.mine.zone_id

  records = [aws_spot_instance_request.nexus.public_ip]
}

resource "aws_spot_instance_request" "nexus" {
  ami           = data.aws_ami.centos-ami.id
  instance_type = var.nexus["instance_type"]
  vpc_security_group_ids = [ aws_security_group.all_traffic.id ]
  wait_for_fulfillment="true"
  spot_type="persistent"
  associate_public_ip_address = true
  instance_interruption_behavior="stop"

  tags = {
        Name = var.nexus["Name"]
    }

  timeouts {
    create = "60m"
    delete = "2h"
  }
} 

resource "aws_ec2_tag" "nexus-tags" {
    resource_id = aws_spot_instance_request.nexus.spot_instance_id
    key         = "Name"
    value       = "${var.env}-nexus"
}


