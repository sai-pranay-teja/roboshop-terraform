resource "aws_ec2_tag" "component-tags" {
    resource_id = var.spot-id
    key         = "Name"
    value       = var.Name
}