provider "aws" {
    region="us-east-1"
  
}



module "security-groups" {
    source = "./security-groups"
  
}

module "roles" {
    source="./roles"
  
}

module "instances" {
    for_each = var.components
    source = "./instances"
    instance_type=each.value["instance_type"]
    Name=each.value["Name"]
    zone_id=var.zone_id
    full_access=module.roles.full_access
    
    security-id=module.security-groups.security-id
  
}

module "prometheus-instance" {
    source = "./prometheus"
    instance_type=var.prometheus["instance_type"]
    Name=var.prometheus["Name"]
    full_access=module.roles.full_access
    
    security-id=module.security-groups.security-id
  
}

/* module "ec2-tags" {
    depends_on = [ module.instances ]
    for_each = var.components
    source = "./ec2-tags"
    Name=each.value["Name"]
    
    spot-id=module.instances[each.key].spot-id
  
} */
