parameters=[
    {Name="env.frontend.catalogue_url", Value="http://catalogue.practise-devops.online:8080/",type="String"},
    {Name="env.frontend.user_url", Value="http://user.practise-devops.online:8080/",type="String"},
    {Name="env.frontend.cart_url", Value="http://cart.practise-devops.online:8080/",type="String"},
    {Name="env.frontend.shipping_url", Value="http://shipping.practise-devops.online:8080/",type="String"},
    {Name="env.frontend.payment_url", Value="http://payment.practise-devops.online:8080/",type="String"},
    {Name="env.shipping.cart_endpoint", Value="cart.practise-devops.online:8080", type="String"},
    {Name="env.shipping.db_host", Value="mysql.practise-devops.online", type="String"},
    {Name="env.user.mongo", Value="true", type="String"},
    {Name="env.user.redis_host", Value="redis.practise-devops.online", type="String"},
    {Name="env.user.mongo_url", Value="mongodb://mongodb.practise-devops.online:27017/users", type="String"},
    {Name="env.payment.cart_host", Value="cart.practise-devops.online", type="String"},
    {Name="env.payment.cart_port", Value="8080", type="String"},
    {Name="env.payment.user_host", Value="user.practise-devops.online", type="String"},
    {Name="env.payment.user_port", Value="8080", type="String"},
    {Name="env.payment.amqp_host", Value="rabbitmq.practise-devops.online", type="String"},    
    {Name="env.catalogue.mongo", Value="true", type="String"},
    {Name="env.catalogue.mongo_url", Value="mongodb://mongodb.practise-devops.online:27017/catalogue", type="String"},
    {Name="env.cart.redis_host", Value="redis.practise-devops.online", type="String"},
    {Name="env.cart.catalogue_host", Value="catalogue.practise-devops.online", type="String"},
    {Name="env.cart.catalogue_port", Value="8080", type="String"}


]


secrets=[
    {Name="env.mysql.host", Value="mysql.practise-devops.online", type="SecureString"},
    {Name="env.mysql.user", Value="root", type="SecureString"},
    {Name="env.mysql.password", Value="RoboShop@1", type="SecureString"},
    {Name="env.payment.amqp_user", Value="roboshop", type="SecureString"},
    {Name="env.payment.amqp_pass", Value="roboshop123", type="SecureString"},
    {Name="env.rabbitmq.amqp_user", Value="roboshop", type="SecureString"},
    {Name="env.rabbitmq.amqp_pass", Value="roboshop123", type="SecureString"},
    {Name="env.ssh.user", Value="centos", type="SecureString"},
    {Name="env.ssh.password", Value="DevOps321", type="SecureString"},
    {Name="env.mongo.host", Value="mongodb.practise-devops.online", type="SecureString"}
    {Name="env.docdb.user", Value="admin1", type="SecureString"}
    {Name="env.docdb.pass", Value="RoboShop1", type="SecureString"} 
]