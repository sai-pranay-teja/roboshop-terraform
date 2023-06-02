/* resource "aws_spot_instance_request" "prometheus" {
    
    ami           = data.aws_ami.centos-ami.id
    instance_type = var.instance_type
    vpc_security_group_ids = [ var.security-id ]
    iam_instance_profile = var.full_access

    tags = {
        Name = var.Name
    }
} */



resource "aws_spot_instance_request" "prometheus" {
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


resource "null_resource" "resource-creation" {
    provisioner "remote-exec" {
    connection {
        host = aws_spot_instance_request.prometheus.public_ip
        user = "centos"
        password = "DevOps321"
    }
    inline=[

        "sudo labauto ansible",
        "sudo labauto prometheus-server",
        "sudo ansible-pull -i localhost, -U https://github.com/sai-pranay-teja/roboshop-ansible.git roboshop-app.yml -e component=${var.Name}"
    ]  



      
}

  
}