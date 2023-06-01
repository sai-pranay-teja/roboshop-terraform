
resource "aws_route53_record" "component-records" {
    zone_id = var.zone_id
    name    = "${var.Name}.practise-devops.online"
    type    = "A"
    ttl     = 30
    records = [aws_spot_instance_request.components.public_ip]
}


resource "aws_spot_instance_request" "components" {
  ami           = data.aws_ami.centos-ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ var.security-id ]
  wait_for_fulfillment="true"
  spot_type="persistent"
  iam_instance_profile = var.full_access

  instance_interruption_behavior="stop"

  tags = {
        Name = var.Name
    }

  timeouts {
    create = "60m"
    delete = "2h"
  }
}

/* resource "aws_instance" "components" {
    
    ami           = "ami-0b5a2b5b8f2be4ec2"
    instance_type = var.instance_type
    vpc_security_group_ids = [ var.security-id ]

    tags = {
        Name = var.Name
    }
} */

    #user_data = "${file("user-data-apache.sh")}"




resource "null_resource" "resource-creation" {
    depends_on = [ aws_route53_record.component-records ]
    provisioner "remote-exec" {
    connection {
        host = aws_spot_instance_request.components.public_ip
        user = "centos"
        password = "DevOps321"
    }
    inline=[

        "sudo labauto ansible",
        "sudo ansible-pull -i localhost, -U https://github.com/sai-pranay-teja/roboshop-ansible.git roboshop-app.yml -e component=${var.Name}"
    ]  



      
}

  
}





