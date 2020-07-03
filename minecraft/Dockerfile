FROM azul/zulu-openjdk:14

RUN install -d -o root -g root /opt/minecraft

ADD https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar /opt/minecraft/server.jar
COPY eula.txt /opt/minecraft/eula.txt
COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /opt/minecraft

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
