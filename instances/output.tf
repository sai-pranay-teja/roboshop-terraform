output "records"{
    value=aws_instance.components.public_ip
}

output "spot-id"{

    value=aws_instance.components.spot_instance_id
}