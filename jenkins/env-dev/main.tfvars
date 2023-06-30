env="dev"
domain_name="practise-devops.online"
parameters=[
    {Name="dev.jenkins-ssh.user", Value="centos", type="SecureString"},
    {Name="dev.jenkins-ssh.pass", Value="DevOps321", type="SecureString"}
    
]

jenkins={
    Name="jenkins"
    instance_type="t3a.medium"
}

/* sonarqube={
    Name="sonarqube"
    instance_type="t3a.medium"
} */