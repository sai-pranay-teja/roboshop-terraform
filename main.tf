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

/* output "endpoint" {
    value=module.elasticache
  
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



module "module-alb" {
    depends_on=[ module.module-vpc ]
    source="git::https://github.com/sai-pranay-teja/module-lb.git"
    env=var.env
    for_each = var.lb
    name=each.value["name"]
    internal=each.value["internal"]
    load_balancer_type=each.value["load_balancer_type"]
    subnet_ids=lookup(local.subnet_ids, each.value["subnet_ids"], null)
    enable_deletion_protection=each.value["enable_deletion_protection"]
    port=each.value["port"]
    allow_subnets=each.value["allow_subnets"]
    vpc_id=module.module-vpc["main"].vpc_id


}

/* output "alb" {
    value=module.module-alb
  
} */

module "module-app" {
    #depends_on=[ module.module-vpc, module.module-alb, module.docdb, module.rds, module.elasticache, module.rabbitmq ]
    depends_on=[ module.module-vpc, module.module-alb ]
    source="git::https://github.com/sai-pranay-teja/module-app.git"
    env=var.env
    for_each = var.app
    component=each.value["component"]
    instance_type=each.value["instance_type"]
    subnet_ids=lookup(local.subnet_ids, each.value["subnets"], null)
    port=each.value["port"]
    parameters=each.value["parameters"]
    allow_subnets=lookup(local.subnet_cidr, each.value["allow_subnets"], null)
    priority=each.value["priority"]
    vpc_id=module.module-vpc["main"].vpc_id
    alb_dns_name=lookup(lookup(lookup(module.module-alb, each.value["alb"], null),"alb", null),"dns_name",null)
    listener_arn=lookup(lookup(lookup(module.module-alb,each.value["alb"], null),"listener_arn",null),"arn",null)
    domain_name=var.domain_name
    default_vpc_id=var.default_vpc_id
    max_size=each.value["max_size"]
    min_size=each.value["min_size"]
    desired_capacity=each.value["desired_capacity"]



}





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