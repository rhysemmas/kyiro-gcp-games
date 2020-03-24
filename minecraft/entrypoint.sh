#!/bin/sh

JVM_OPTS=${JVM_OPTS:-"-XX:MaxRAMPercentage=95"}

exec /usr/bin/java ${JVM_OPTS} -jar /opt/minecraft/server.jar nogui
