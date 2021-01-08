FROM azul/zulu-openjdk:14

RUN install -d -o root -g root /opt/minecraft

ADD https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar /opt/minecraft/server.jar
COPY eula.txt /opt/minecraft/eula.txt
COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /opt/minecraft

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
