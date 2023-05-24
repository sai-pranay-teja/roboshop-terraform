provider "aws" {
    region="us-east-1"
  
}



module "security-groups" {
    source = "./security-groups"
  
}


module "instances" {
    for_each = var.components
    source = "./instances"
    instance_type=each.value["instance_type"]
    Name=each.value["Name"]
    zone_id=var.zone_id
    
    security-id=module.security-groups.security-id
  
}


module "ec2-tags" {
    depends_on = [ module.instances ]
    for_each = var.components
    source = "./ec2-tags"
    Name=each.value["Name"]
    
    spot-id=module.instances[each.key].spot-id
  
}

output "public-ip" {
    value= "${[for instance in var.components: values(instance)[0]]}-${module.instances.records}"

  
}