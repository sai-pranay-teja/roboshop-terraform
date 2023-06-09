resource "aws_ssm_parameter" "parameters" {
    count = length(var.parameters)
    name  = var.parameters[count.index].Name
    type  = var.parameters[count.index].type
    value = var.parameters[count.index].Value
}
