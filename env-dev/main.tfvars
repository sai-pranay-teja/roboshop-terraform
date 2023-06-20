domain_name="practise-devops.online"
env="dev"
default_vpc_id="vpc-0d18c03eafca9b0f5"

vpc={
    main={
        cidr_block="10.0.0.0/24"


        public={
            public-az1={
                name="public-az1"
                cidr="10.0.0.0/28"
                availability_zone="us-east-1a"

            }
            public-az2={
                name="public-az2"
                cidr="10.0.0.16/28"
                availability_zone="us-east-1b"

            }
            
        }

        private={
            web-az1={
                name="web-az1"
                cidr="10.0.0.32/28"
                availability_zone="us-east-1a"

            }
            web-az2={
                name="web-az2"
                cidr="10.0.0.48/28"
                availability_zone="us-east-1b"

            }
            app-az1={
                name="app-az1"
                cidr="10.0.0.64/28"
                availability_zone="us-east-1a"

            }
            app-az2={
                name="app-az2"
                cidr="10.0.0.80/28"
                availability_zone="us-east-1b"

            }
            db-az1={
                name="db-az1"
                cidr="10.0.0.96/28"
                availability_zone="us-east-1a"

            }
            db-az2={
                name="db-az2"
                cidr="10.0.0.112/28"
                availability_zone="us-east-1b"

            }
        }
    }


}


/* docdb={
    main={
        engine = "docdb"
        engine_version = "4.0.0"
        backup_retention_period = 2
        preferred_backup_window = "07:00-09:00"
        skip_final_snapshot     = true
        no_of_instances = 1
        instance_class     = "db.t3.medium"
        allow_subnets = "app"


    }



}

rds={
    main={
        engine                  = "aurora-mysql"
        engine_version          = "5.7.mysql_aurora.2.11.1"
        database_name = "roboshop"
        skip_final_snapshot     = true
        backup_retention_period = 1
        preferred_backup_window = "07:00-09:00"
        no_of_instances = 1
        instance_class     = "db.t3.small"
        allow_subnets = "app"


    }



}

elasticache={
    main={
        engine                  = "redis"
        node_type          = "cache.t3.micro"
        num_cache_nodes = 1
        engine_version = "6.x"
        port = 6379
        allow_subnets = "app"


    }



}


rabbitmq={
    main={
        instance_type="t3.small"
        allow_subnets="app"
        component="rabbitmq"



    }



} */

lb={
    public={
        name="public"
        internal=false
        load_balancer_type="application"
        enable_deletion_protection=false
        port="80"
        allow_subnets=["0.0.0.0/0"]
        subnet_ids="public"
    }
    private={
        name="private"
        internal=true
        load_balancer_type="application"
        enable_deletion_protection=false
        port="80"
        allow_subnets=["10.0.0.32/28","10.0.0.48/28","10.0.0.64/28","10.0.0.80/28"]
        subnet_ids="app"
    }


}

app={
    catalogue={
        component="catalogue"
        instance_type="t3.small"
        port=8080
        subnets="app"
        allow_subnets="app"
        max_size=1
        min_size=1
        desired_capacity=1
        alb="private"
        priority=10
        parameters=["docdb"]
    }
    cart={
        component="cart"
        instance_type="t3.small"
        port=8080
        subnets="app"
        allow_subnets="app"
        max_size=1
        min_size=1
        desired_capacity=1
        alb="private"
        priority=11
        parameters=["elasticache"]
    }
    shipping={
        component="shipping"
        instance_type="t3.small"
        port=8080
        subnets="app"
        allow_subnets="app"
        max_size=1
        min_size=1
        desired_capacity=1
        alb="private"
        priority=12
        parameters=["rds"]
    }
    payment={
        component="payment"
        instance_type="t3.small"
        port=8080
        subnets="app"
        allow_subnets="app"
        max_size=1
        min_size=1
        desired_capacity=1
        alb="private"
        priority=13
        parameters=["rabbitmq"]
    }
    user={
        component="user"
        instance_type="t3.small"
        port=8080
        subnets="app"
        allow_subnets="app"
        max_size=1
        min_size=1
        desired_capacity=1
        alb="private"
        priority=14
        parameters=["docdb","elasticache"]
    }
    frontend={
        component="frontend"
        instance_type="t3.small"
        port=80
        subnets="web"
        allow_subnets="public"
        max_size=1
        min_size=1
        desired_capacity=1
        alb="public"
        priority=15
        parameters=[]
    }
}







/* components={
    frontend={
        Name="frontend"
        instance_type="t3.micro"

    }
    mongodb={
        Name="mongodb"
        instance_type="t3.micro"

    }
    mysql={
        Name="mysql"
        instance_type="t3.micro"

    }
    rabbitmq={
        Name="rabbitmq"
        instance_type="t3.micro"

    }
    redis={
        Name="redis"
        instance_type="t3.micro"

    }
    cart={
        Name="cart"
        instance_type="t3.micro"

    }
    catalogue={
        Name="catalogue"
        instance_type="t3.micro"

    }

    payment={
        Name="payment"
        instance_type="t3.micro"

    }
    shipping={
        Name="shipping"
        instance_type="t3.micro"

    }
    user={
        Name="user"
        instance_type="t3.micro"

    }
   

}

prometheus={
    Name="prometheus"
    instance_type="t3.micro"

    }


elk={
    Name="elk"
    instance_type="t3.large" 

    }
*/