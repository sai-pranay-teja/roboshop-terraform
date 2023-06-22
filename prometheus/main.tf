



resource "aws_spot_instance_request" "prometheus" {
  ami           = data.aws_ami.centos-ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.all_traffic.id ]
  wait_for_fulfillment="true"
  spot_type="persistent"
  subnet_id = var.default_subnet_ids
  iam_instance_profile = aws_iam_instance_profile.access-profile.name

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
            user = data.aws_ssm_parameter.user.value
            password = data.aws_ssm_parameter.pass.value
    }
    inline=[

        "sudo labauto ansible",
        "sudo labauto prometheus-server",
        "sudo ansible-pull -i localhost, -U https://github.com/sai-pranay-teja/roboshop-ansible.git roboshop-app.yml -e components=${var.Name}"
    ]  



      
}

  
}