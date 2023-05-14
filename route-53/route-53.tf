resource "aws_route53_record" "component-records" {
    
    name    = "${var.Name}.practise-devops.online"
    type    = "A"
    ttl     = 30
    records = [var.records]
}