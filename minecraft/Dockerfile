FROM azul/zulu-openjdk:14

RUN install -d -o root -g root /opt/minecraft

ADD https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar /opt/minecraft/server.jar
COPY eula.txt /opt/minecraft/eula.txt
COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /opt/minecraft

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
