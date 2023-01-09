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

docker rm "$(docker ps -a | grep $(pwd | awk -F'/' '{print $NF}') | awk -F ' ' '{print $1}')"
n

# rabbitmqctl set_user_tags rabbit administrator && rabbitmqctl set_permissions -p "/" "rabbit" ".*" ".*" ".*"
 
# rabbitmqctl add_user rabbit rabbit && rabbitmqctl set_user_tags rabbit administrator && rabbitmqctl set_permissions -p "/" "rabbit" ".*" ".*" ".*"

OLD rabbitmq.conf

# default is "guest", and its access is limited to localhost only.
# See https://www.rabbitmq.com/access-control.html#default-state
default_user = rabbit
default_pass = rabbit
default_vhost = /
default_permissions.configure = .*
default_permissions.read = .*
default_permissions.write = .*

# 768a852ed69ce916fa7faa278c962de3e4275e5f
# MGFjMjlhNTliOThiNDA2MzhkOGJjY2FmYWZhYzBiNmM4YjU5N2MyYTM0YmE3ZTRmNzkzNjg4ODg2
# c773d81d1f6b1d7bb58bd3b30f732a12
# 6bd3dfc536ef1cbc71af711b98e596b911c2c5f11342f83e011c04eb8a6c3413

# rabbitmqctl set_user_tags rabbit administrator && rabbitmqctl set_permissions -p "/" "rabbit" ".*" ".*" ".*"
 
 # rabbitmqctl add_user rabbit rabbit && rabbitmqctl set_user_tags rabbit administrator && rabbitmqctl set_permissions -p "/" "rabbit" ".*" ".*" ".*"

Removed the erlang cookie


  erlang.cookie: |
    
