variable "env" {}
variable "jenkins"{}
variable "parameters"{}
variable "domain_name"{}

variable "s-jobs" {
    default=[
        {name="Infra", repo_url="https://github.com/sai-pranay-teja/module-jenkins", filename="Infra-setup"}
    ] 
}