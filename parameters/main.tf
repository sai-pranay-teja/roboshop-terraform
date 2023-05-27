provider "aws" {
    region = "us-east-1"
  
}


variable "parameters"{}
variable "secrets"{}

resource "aws_ssm_parameter" "parameters" {
    count = length(var.parameters)
    name  = var.parameters[count.index].Name
    type  = var.parameters[count.index].type
    value = var.parameters[count.index].Value
}

resource "aws_ssm_parameter" "secrets" {
    count = length(var.secrets)
    name  = var.secrets[count.index].Name
    type  = var.secrets[count.index].type
    value = var.secrers[count.index].Value
}