provider "aws" {
    region="us-east-1"
  
}


module "module-vpc" {
    source = "git::https://github.com/sai-pranay-teja/module-vpc.git"
    env=var.env
    default_vpc_id=var.default_vpc_id
    for_each=var.vpc
    availability_zone=each.value["availability_zone"]
    cidr_block=each.value["cidr_block"]
    public_cidr=each.value["public"]
    private_cidr=each.value["private"]

    
}

/* output "vpc"{
    value=module.module-vpc
} */



















/* module "security-groups" {
    source = "./security-groups"
  
} */

/* module "roles" {
    source="./roles"
  
} */

/* module "instances" {
    for_each = var.components
    source = "./instances"
    instance_type=each.value["instance_type"]
    Name=each.value["Name"]
    zone_id=var.zone_id
    full_access=module.roles.full_access
    
    security-id=module.security-groups.security-id
  
}

module "prometheus-instance" {
    #depends_on = [ module.instances ]
    source = "./prometheus"
    instance_type=var.prometheus["instance_type"]
    Name=var.prometheus["Name"]
    full_access=module.roles.full_access
    
    security-id=module.security-groups.security-id
  
}

module "ec2-tags" {
    depends_on = [ module.instances ]
    for_each = var.components
    source = "./ec2-tags"
    Name=each.value["Name"]
    
    spot-id=module.instances[each.key].spot-id
  
}

module "elk-instance" {
    #depends_on = [ module.instances ]
    source = "./elk"
    instance_type=var.elk["instance_type"]
    Name=var.elk["Name"]
    full_access=module.roles.full_access
    
    security-id=module.security-groups.security-id
  
} */