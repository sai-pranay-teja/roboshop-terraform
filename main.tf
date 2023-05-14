module "instances" {
    for_each = var.components
    instance_type=each.value["instance_type"]
    Name=each.value["Name"]
    source = "./instances"
    security-id=module.security-groups[each.key].security-id
  
}
module "route-53" {
    depends_on = [ module.instances ]
    for_each = var.components
    zone_id = var.zone_id
    Name=each.value["Name"]

    source = "./route-53"
    records=module.instances[each.key].records
  
}
module "security-groups" {
    source = "./security-groups"
  
}
module "ec2-tags" {
    depends_on = [ module.instances ]
    for_each = var.components
    Name=each.value["Name"]
    source = "./ec2-tags"
    spot-id=module.instances[each.key].spot-id
  
}