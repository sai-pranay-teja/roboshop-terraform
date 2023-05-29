output "records"{
    value=aws_spot_request_instance.components.public_ip
}

output "spot-id"{

    value=aws_spot_request_instance.components.id
}