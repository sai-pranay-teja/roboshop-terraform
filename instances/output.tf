output "records"{
    value=aws_spot_instance_request.components.public_ip
}

output "spot-id"{

    value=aws_spot_instance_request.components.spot_instance_id
}