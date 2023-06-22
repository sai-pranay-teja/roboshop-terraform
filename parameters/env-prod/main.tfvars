parameters=[
    {Name="prod.frontend.catalogue_url", Value="http://prod-catalogue.practise-devops.online:80/",type="String"},
    {Name="prod.frontend.user_url", Value="http://prod-user.practise-devops.online:80/",type="String"},
    {Name="prod.frontend.cart_url", Value="http://prod-cart.practise-devops.online:80/",type="String"},
    {Name="prod.frontend.shipping_url", Value="http://prod-shipping.practise-devops.online:80/",type="String"},
    {Name="prod.frontend.payment_url", Value="http://prod-payment.practise-devops.online:80/",type="String"},
    {Name="prod.shipping.cart_endpoint", Value="prod-cart.practise-devops.online:80", type="String"},
    {Name="prod.shipping.db_host", Value="mysql.practise-devops.online", type="String"},
    {Name="prod.user.mongo", Value="true", type="String"},
    {Name="prod.user.redis_host", Value="redis.practise-devops.online", type="String"},
    {Name="prod.user.mongo_url", Value="mongodb://mongodb.practise-devops.online:27017/users", type="String"},
    {Name="prod.payment.cart_host", Value="prod-cart.practise-devops.online", type="String"},
    {Name="prod.payment.cart_port", Value="80", type="String"},
    {Name="prod.payment.user_host", Value="prod-user.practise-devops.online", type="String"},
    {Name="prod.payment.user_port", Value="80", type="String"},
    {Name="prod.payment.amqp_host", Value="rabbitmq-prod.practise-devops.online", type="String"},    
    {Name="prod.catalogue.mongo", Value="true", type="String"},
    {Name="prod.catalogue.mongo_url", Value="mongodb://mongodb.practise-devops.online:27017/catalogue", type="String"},
    {Name="prod.cart.redis_host", Value="redis.practise-devops.online", type="String"},
    {Name="prod.cart.catalogue_host", Value="prod-catalogue.practise-devops.online", type="String"},
    {Name="prod.cart.catalogue_port", Value="80", type="String"}


]


secrets=[
    {Name="prod.mysql.password", Value="RoboShop@1", type="SecureString"},
    {Name="prod.rds.user", Value="admin1", type="SecureString"},
    {Name="prod.rds.pass", Value="RoboShop1", type="SecureString"},
    {Name="prod.payment.amqp_user", Value="roboshop", type="SecureString"},
    {Name="prod.payment.amqp_pass", Value="roboshop123", type="SecureString"},
    {Name="prod.rabbitmq.amqp_user", Value="roboshop", type="SecureString"},
    {Name="prod.rabbitmq.amqp_pass", Value="roboshop123", type="SecureString"},
    {Name="prod.ssh.user", Value="centos", type="SecureString"},
    {Name="prod.ssh.password", Value="DevOps321", type="SecureString"},
    {Name="prod.mongo.host", Value="mongodb.practise-devops.online", type="SecureString"},
    {Name="prod.docdb.user", Value="admin1", type="SecureString"},
    {Name="prod.docdb.pass", Value="RoboShop1", type="SecureString"} 
]