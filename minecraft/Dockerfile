FROM azul/zulu-openjdk:8

RUN useradd minecraft \
 && install -o minecraft -g minecraft -d /home/minecraft

USER minecraft
WORKDIR /home/minecraft

ADD --chown=minecraft https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar /home/minecraft/server.jar
COPY --chown=minecraft eula.txt /home/minecraft/eula.txt

ENTRYPOINT ["/usr/bin/java"]
CMD ["-Xmx1024M", "-Xms1024M", "-jar", "/home/minecraft/server.jar", "nogui"]
