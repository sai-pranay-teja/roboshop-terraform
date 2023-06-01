resource "aws_instance" "prometheus" {
    
    ami           = data.aws_ami.centos-ami.id
    instance_type = var.instance_type
    vpc_security_group_ids = [ var.security-id ]
    iam_instance_profile = var.full_access

    tags = {
        Name = var.Name
    }
}






resource "null_resource" "resource-creation" {
    provisioner "remote-exec" {
    connection {
        host = aws_instance.prometheus.public_ip
        user = data.aws_ssm_parameter.username.value
        password = data.aws_ssm_parameter.password.value
    }
    inline=[

        "sudo labauto ansible",
        "sudo labauto prometheus-server",
        "sudo ansible-pull -i localhost, -U https://github.com/sai-pranay-teja/roboshop-ansible.git roboshop-app.yml -e component=${var.Name}"
    ]  



      
}

  
}