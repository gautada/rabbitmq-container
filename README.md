# rabbitmq-container

[RabbitMQ](https://www.rabbitmq.com) is lightweight and easy to deploy on premises and in the cloud. It supports multiple messaging protocols. RabbitMQ can be deployed in distributed and federated configurations to meet high-scale, high-availability requirements.


Plugins


## Notes

- Admin iterface is on port 15672 [Development](http://localhost:15672)
- A user must be created using `rabbitmqctl add_user full_access s3crEt` and granted management access using `rabbitmqctl set_user_tags full_access administrator`; Example: `rabbitmqctl add_user test test && rabbitmqctl set_user_tags test administrator`. 


rabbitmqctl --node rabbit@"$(hostname)" add_user test test && rabbitmqctl set_user_tags test administrator

rabbitmqctl add_user test test && rabbitmqctl set_permissions -p "/" "test" ".*" ".*" ".*"

rabbitmqctl set_user_tags test administrator

docker exec -it $(docker ps -q) /bin/ash

