/* resource "aws_instance" "elk" {
    
    ami           = data.aws_ami.centos-ami.id
    instance_type = var.instance_type
    vpc_security_group_ids = [ var.security-id ]
    iam_instance_profile = var.full_access

    tags = {
        Name = var.Name
    }
} */



resource "aws_spot_instance_request" "elk" {
  ami           = data.aws_ami.centos-ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.all_traffic.id ]
  wait_for_fulfillment="true"
  spot_type="persistent"
  iam_instance_profile = aws_iam_instance_profile.access-profile.name
  subnet_id = var.default_public_subnets
  associate_public_ip_address = true
  instance_interruption_behavior="stop"
  user_data = base64encode(templatefile("${path.module}/userdata.sh" , {
    Name=var.Name


  }))
  tags = {
        Name = var.Name
    }

  timeouts {
    create = "60m"
    delete = "2h"
  }
}

resource "aws_ec2_tag" "component-tags" {
    resource_id = aws_spot_instance_request.elk.spot_instance_id
    key         = "Name"
    value       = "${var.env}-elk"
}


/* resource "null_resource" "resource-creation" {
  depends_on = [ aws_spot_instance_request.elk ]
  provisioner "remote-exec" {
    connection {
      host = aws_spot_instance_request.elk.public_ip
      user = data.aws_ssm_parameter.user.value
      password = data.aws_ssm_parameter.pass.value
    }
    inline=[

        "sudo labauto ansible",
        "sudo labauto elk",
        "sudo ansible-pull -i localhost, -U https://github.com/sai-pranay-teja/roboshop-ansible.git roboshop-app.yml -e components=${var.Name}"
    ]  



      
}

  
} */