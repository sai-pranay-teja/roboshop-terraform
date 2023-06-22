locals {
  subnet_ids={
    db=tolist([module.module-vpc["main"].private_subnets["db-az1"].id, module.module-vpc["main"].private_subnets["db-az2"].id])
    app=tolist([module.module-vpc["main"].private_subnets["app-az1"].id, module.module-vpc["main"].private_subnets["app-az2"].id])
    web=tolist([module.module-vpc["main"].private_subnets["web-az1"].id, module.module-vpc["main"].private_subnets["web-az2"].id])
    public=tolist([module.module-vpc["main"].public_subnets["public-az1"].id, module.module-vpc["main"].public_subnets["public-az2"].id])
  }
  
  subnet_cidr={
    db=tolist([module.module-vpc["main"].private_subnets["db-az1"].cidr_block, module.module-vpc["main"].private_subnets["db-az2"].cidr_block])
    app=tolist([module.module-vpc["main"].private_subnets["app-az1"].cidr_block, module.module-vpc["main"].private_subnets["app-az2"].cidr_block])
    web=tolist([module.module-vpc["main"].private_subnets["web-az1"].cidr_block, module.module-vpc["main"].private_subnets["web-az2"].cidr_block])
    public=tolist([module.module-vpc["main"].public_subnets["public-az1"].cidr_block, module.module-vpc["main"].public_subnets["public-az2"].cidr_block])
  }


db_subnet_ids=tolist([module.module-vpc["main"].private_subnets["db-az1"].id, module.module-vpc["main"].private_subnets["db-az2"].id])
app_subnet_ids=tolist([module.module-vpc["main"].private_subnets["app-az1"].id, module.module-vpc["main"].private_subnets["app-az2"].id])
web_subnet_ids=tolist([module.module-vpc["main"].private_subnets["web-az1"].id, module.module-vpc["main"].private_subnets["web-az2"].id])

default_subnet_ids=tolist([module.module-vpc["main"].default_public_subnets.id])


}