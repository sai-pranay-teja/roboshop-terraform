provider "aws" {
    region="us-east-1"
  
}



module "security-groups" {
    source = "./security-groups"
  
}

module "route-53" {

    for_each = var.components
    source = "./route-53"
    zone_id = var.zone_id
    Name=each.value["Name"]

    
    records=module.instances[each.key].records
  
}

module "instances" {
    for_each = var.components
    source = "./instances"
    instance_type=each.value["instance_type"]
    Name=each.value["Name"]
    
    security-id=module.security-groups.security-id
  
}


module "ec2-tags" {
    depends_on = [ module.instances ]
    for_each = var.components
    source = "./ec2-tags"
    Name=each.value["Name"]
    
    spot-id=module.instances[each.key].spot-id
  
}