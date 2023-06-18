parameters=[
    {Name="dev.frontend.catalogue_url", Value="http://catalogue.practise-devops.online:8080/",type="String"},
    {Name="dev.frontend.user_url", Value="http://user.practise-devops.online:8080/",type="String"},
    {Name="dev.frontend.cart_url", Value="http://cart.practise-devops.online:8080/",type="String"},
    {Name="dev.frontend.shipping_url", Value="http://shipping.practise-devops.online:8080/",type="String"},
    {Name="dev.frontend.payment_url", Value="http://payment.practise-devops.online:8080/",type="String"},
    {Name="dev.shipping.cart_endpoint", Value="cart.practise-devops.online:8080", type="String"},
    {Name="dev.shipping.db_host", Value="mysql.practise-devops.online", type="String"},
    {Name="dev.user.mongo", Value="true", type="String"},
    {Name="dev.user.redis_host", Value="redis.practise-devops.online", type="String"},
    {Name="dev.user.mongo_url", Value="mongodb://mongodb.practise-devops.online:27017/users", type="String"},
    {Name="dev.payment.cart_host", Value="cart.practise-devops.online", type="String"},
    {Name="dev.payment.cart_port", Value="8080", type="String"},
    {Name="dev.payment.user_host", Value="user.practise-devops.online", type="String"},
    {Name="dev.payment.user_port", Value="8080", type="String"},
    {Name="dev.payment.amqp_host", Value="rabbitmq.practise-devops.online", type="String"},    
    {Name="dev.catalogue.mongo", Value="true", type="String"},
    {Name="dev.catalogue.mongo_url", Value="mongodb://mongodb.practise-devops.online:27017/catalogue", type="String"},
    {Name="dev.cart.redis_host", Value="redis.practise-devops.online", type="String"},
    {Name="dev.cart.catalogue_host", Value="catalogue.practise-devops.online", type="String"},
    {Name="dev.cart.catalogue_port", Value="8080", type="String"}


]


secrets=[
    {Name="dev.mysql.password", Value="RoboShop@1", type="SecureString"},
    {Name="dev.rds.user", Value="admin1", type="SecureString"},
    {Name="dev.rds.pass", Value="RoboShop1", type="SecureString"},
    {Name="dev.payment.amqp_user", Value="roboshop", type="SecureString"},
    {Name="dev.payment.amqp_pass", Value="roboshop123", type="SecureString"},
    {Name="dev.rabbitmq.amqp_user", Value="roboshop", type="SecureString"},
    {Name="dev.rabbitmq.amqp_pass", Value="roboshop123", type="SecureString"},
    {Name="dev.ssh.user", Value="centos", type="SecureString"},
    {Name="dev.ssh.password", Value="DevOps321", type="SecureString"},
    {Name="dev.mongo.host", Value="mongodb.practise-devops.online", type="SecureString"},
    {Name="dev.docdb.user", Value="admin1", type="SecureString"},
    {Name="dev.docdb.pass", Value="RoboShop1", type="SecureString"} 
]