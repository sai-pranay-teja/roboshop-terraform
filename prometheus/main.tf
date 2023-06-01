resource "aws_instance" "components" {
    
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
        host = aws_instance.components.public_ip
        user = "centos"
        password = "DevOps321"
    }
    inline=[

        "sudo labauto ansible",
        "sudo labauto prometheus-server",
        "sudo ansible-pull -i localhost, -U https://github.com/sai-pranay-teja/roboshop-ansible.git roboshop-app.yml -e component=prometheus"
    ]  



      
}

  
}