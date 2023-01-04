ARG ALPINE_VERSION="3.17.0"

FROM gautada/alpine:$ALPINE_VERSION

# ╭――――――――――――――――――――╮
# │ METADATA           │
# ╰――――――――――――――――――――╯
LABEL source="https://github.com/gautada/rabbitmq-container.git"
LABEL maintainer="Adam Gautier <adam@gautier.org>"
LABEL description="A container for a rabbit message queue"

# ╭――――――――――――――――――――╮
# │ STANDARD CONFIG    │
# ╰――――――――――――――――――――╯

# USER:
ARG USER=rabbitmq

ARG UID=1001
ARG GID=1001
RUN /usr/sbin/addgroup -g $GID $USER \
 && /usr/sbin/adduser -D -G $USER -s /bin/ash -u $UID $USER \
 && /usr/sbin/usermod -aG wheel $USER \
 && /bin/echo "$USER:$USER" | chpasswd

# PRIVILEGE:
COPY wheel  /etc/container/wheel

# BACKUP:
COPY backup /etc/container/backup

# ENTRYPOINT:
RUN rm -v /etc/container/entrypoint
COPY entrypoint /etc/container/entrypoint

# FOLDERS
RUN /bin/chown -R $USER:$USER /mnt/volumes/container \
 && /bin/chown -R $USER:$USER /mnt/volumes/backup \
 && /bin/chown -R $USER:$USER /var/backup \
 && /bin/chown -R $USER:$USER /tmp/backup


# ╭――――――――――――――――――――╮
# │ APPLICATION        │
# ╰――――――――――――――――――――╯
# RUN /sbin/apk add --no-cache build-base git libffi-dev linux-headers mysql python3-dev py3-pip py3-setuptools
RUN /sbin/apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing rabbitmq-server
RUN mkdir -p /etc/rabbitmq
# RUN touch /etc/rabbitmq/rabbitmq.conf

RUN /bin/ln -svf /etc/container/erlang.cookie /home/$USER/.erlang.cookie \
  && /bin/ln -svf /mnt/volumes/configmaps/erlang.cookie /etc/container/erlang.cookie \
  && /bin/ln -svf /mnt/volumes/container/erlang.cookie /mnt/volumes/configmaps/erlang.cookie

RUN /bin/ln -svf /etc/container/rabbitmq.conf /etc/rabbitmq/rabbitmq.conf \
  && /bin/ln -svf /mnt/volumes/configmaps/rabbitmq.conf /etc/container/rabbitmq.conf \
  && /bin/ln -svf /mnt/volumes/container/rabbitmq.conf /mnt/volumes/configmaps/rabbitmq.conf

RUN /bin/ln -svf /etc/container/rabbitmq-env.conf /etc/rabbitmq/rabbitmq-env.conf \
  && /bin/ln -svf /mnt/volumes/configmaps/rabbitmq-env.conf /etc/container/rabbitmq-env.conf \
  && /bin/ln -svf /mnt/volumes/container/rabbitmq-env.conf /mnt/volumes/configmaps/rabbitmq-env.conf


# RUN ls -l /var/lib/rabbitmq/mnesia && /bin/rmdir /var/lib/rabbitmq \
#  && /bin/ln -svf /mnt/volumes/container/broker /var/lib/rabbitmq
  
RUN /usr/sbin/rabbitmq-plugins enable --offline rabbitmq_management
# RUN mkdir -p /run/mysqld
# RUN chown $USER:$USER -R /run/mysqld
# RUN /bin/mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf~ \
#  && /bin/ln -svf /mnt/volumes/configmaps/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf \
#  && /bin/ln -svf /mnt/volumes/container/mariadb-server.cnf /mnt/volumes/configmaps/mariadb-server.cnf





# ╭――――――――――――――――――――╮
# │ CONTAINER          │
# ╰――――――――――――――――――――╯
USER $USER
VOLUME /mnt/volumes/backup
VOLUME /mnt/volumes/configmaps
VOLUME /mnt/volumes/container
EXPOSE 3306/tcp
WORKDIR /home/$USER
