resource "aws_ec2_tag" "component-tags" {
    for_each = var.components
    depends_on = [ aws_spot_instance_request.components ]
    resource_id = aws_spot_instance_request.components[each.key].spot_instance_id
    key         = "Name"
    value       = each.value["Name"]
}