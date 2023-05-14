provider "aws" {
    region="us-east-1"
  
}

resource "aws_spot_instance_request" "components" {
    for_each = var.components
    ami           = "ami-0b5a2b5b8f2be4ec2"
    instance_type = each.value["instance_type"]
    wait_for_fulfillment = true
    spot_type="persistent"
    instance_interruption_behavior="stop"
    security_groups = [ aws_security_group.all_traffic.id ]

    tags = {
        Name = each.value["Name"]
    }

    timeouts {
        create = "10m"
        delete = "10m"
    }

/* provisioner "remote-exec" {
    connection {
        host = aws_spot_instance_request.components.public_ip
        user = "centos"
        password = "DevOps321"
    }
    inline=[

    ]  



      
} */
}






