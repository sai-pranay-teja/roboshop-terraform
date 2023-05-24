
resource "aws_route53_record" "component-records" {
    zone_id = var.zone_id
    name    = "${var.Name}.practise-devops.online"
    type    = "A"
    ttl     = 30
    records = [aws_spot_instance_request.components.private_ip]
}





resource "aws_spot_instance_request" "components" {
    
    ami           = "ami-0b5a2b5b8f2be4ec2"
    instance_type = var.instance_type
    wait_for_fulfillment = true
    spot_type="persistent"
    instance_interruption_behavior="stop"
    vpc_security_group_ids = [ var.security-id ]
    availability_zone = "any"

    tags = {
        Name = var.Name
    }

    timeouts {
        create = "60m"
        delete = "60m"
    }
    #user_data = "${file("user-data-apache.sh")}"


}

resource "null_resource" "resource-creation" {
    depends_on = [ aws_route53_record.component-records ]
    provisioner "remote-exec" {
    connection {
        host = aws_spot_instance_request.components.public_ip
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





