FROM azul/zulu-openjdk:8

RUN install -d -o root -g root /opt/minecraft

ADD https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar /opt/minecraft/server.jar
COPY eula.txt /opt/minecraft/eula.txt

WORKDIR /opt/minecraft

ENTRYPOINT ["/usr/bin/java"]
CMD ["-Xmx1024M", "-Xms1024M", "-jar", "/opt/minecraft/server.jar", "nogui"]
