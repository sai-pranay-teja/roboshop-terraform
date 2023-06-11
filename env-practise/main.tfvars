zone_id="Z02663713JHB580GK666M"
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


docdb={
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