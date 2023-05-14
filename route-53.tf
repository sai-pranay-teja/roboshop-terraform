resource "aws_route53_record" "component-records" {
    for_each = var.components
    depends_on = [ aws_spot_instance_request.components ]
    zone_id = var.zone_id
    name    = "${each.value["Name"]}.practise-devops.online"
    type    = "A"
    ttl     = 30
    records = [aws_spot_instance_request.components.public_ip]
}