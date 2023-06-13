provider "aws" {
    region="us-east-1"
  
}


module "module-vpc" {
    source = "git::https://github.com/sai-pranay-teja/module-vpc.git"
    env=var.env
    default_vpc_id=var.default_vpc_id
    for_each=var.vpc
    cidr_block=each.value["cidr_block"]
    public_cidr=each.value["public"]
    private_cidr=each.value["private"]

    
}


/* module "docdb" {
    depends_on = [ module.module-vpc ]
    source="git::https://github.com/sai-pranay-teja/module-docdb.git"
    env=var.env
    subnet_ids=local.db_subnet_ids
    for_each=var.docdb
    engine = each.value["engine"]
    engine_version = each.value["engine_version"]
    backup_retention_period = each.value["backup_retention_period"]
    preferred_backup_window = each.value["preferred_backup_window"]
    skip_final_snapshot = each.value["skip_final_snapshot"]
    no_of_instances = each.value["no_of_instances"]
    instance_class = each.value["instance_class"]
    vpc_id=module.module-vpc["main"].vpc_id
    allow_subnets=lookup(local.subnet_cidr, each.value["allow_subnets"], null)
    
} */




/* module "rds" {
    depends_on = [ module.module-vpc ]
    source="git::https://github.com/sai-pranay-teja/module-rds.git"
    env=var.env
    subnet_ids=local.db_subnet_ids
    for_each=var.rds
    engine = each.value["engine"]
    engine_version = each.value["engine_version"]
    database_name = each.value["database_name"]
    backup_retention_period = each.value["backup_retention_period"]
    preferred_backup_window = each.value["preferred_backup_window"]
    skip_final_snapshot = each.value["skip_final_snapshot"]
    no_of_instances = each.value["no_of_instances"]
    instance_class = each.value["instance_class"]
    vpc_id=module.module-vpc["main"].vpc_id
    allow_subnets=lookup(local.subnet_cidr, each.value["allow_subnets"], null)
    
} */



/* module "elasticache" {
    depends_on = [ module.module-vpc ]
    source="git::https://github.com/sai-pranay-teja/module-elasticache.git"
    env=var.env
    subnet_ids=local.db_subnet_ids
    for_each=var.elasticache
    engine = each.value["engine"]
    engine_version = each.value["engine_version"]
    node_type=each.value["node_type"]
    num_cache_nodes=each.value["num_cache_nodes"]
    port=each.value["port"]
    vpc_id=module.module-vpc["main"].vpc_id
    allow_subnets=lookup(local.subnet_cidr, each.value["allow_subnets"], null)
    
} */



/* module "rabbitmq" {
    depends_on = [ module.module-vpc ]
    source="git::https://github.com/sai-pranay-teja/module-rabbitmq.git"
    env=var.env
    subnet_ids=local.db_subnet_ids
    for_each=var.rabbitmq
    vpc_id=module.module-vpc["main"].vpc_id
    allow_subnets=lookup(local.subnet_cidr, each.value["allow_subnets"], null)
    domain_name=var.domain_name
    default_vpc_id=var.default_vpc_id
    instance_type=each.value["instance_type"]
    component=each.value["component"]


    
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