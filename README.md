# rabbitmq-container

[RabbitMQ](https://www.rabbitmq.com) is lightweight and easy to deploy on premises and in the cloud. It supports multiple messaging protocols. RabbitMQ can be deployed in distributed and federated configurations to meet high-scale, high-availability requirements.


Plugins
15672


# create a user
rabbitmqctl add_user full_access s3crEt
# tag the user with "administrator" for full management UI and HTTP API access
rabbitmqctl set_user_tags full_access administrator

rabbitmqctl add_user test test && rabbitmqctl set_user_tags test administrator
