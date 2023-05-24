
resource "aws_route53_record" "component-records" {
    zone_id = var.zone_id
    name    = "${var.Name}.practise-devops.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.components.private_ip]
}





resource "aws_instance" "components" {
    
    ami           = "ami-0b5a2b5b8f2be4ec2"
    instance_type = var.instance_type
    security_groups = [ var.security-id ]
    /* availability_zone = "us-east-1b" */

    tags = {
        Name = var.Name
    }


    #user_data = "${file("user-data-apache.sh")}"


}

resource "null_resource" "resource-creation" {
    depends_on = [ aws_route53_record.component-records ]
    provisioner "remote-exec" {
    connection {
        host = aws_instance.components.public_ip
        user = "centos"
        password = "DevOps321"
    }
    inline=[
        /* "sudo git clone https://github.com/sai-pranay-teja/practise-roboshop-shell",
        "cd practise-roboshop-shell",
        "sudo bash ${var.Name}.sh" */
        "sudo labauto ansible"
    ]  



      
}

  
}





