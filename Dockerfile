FROM ubuntu:18.04

RUN apt-get update; \
    apt-get -y install openjdk-8-jre-headless

WORKDIR /minecraft

ENV JAVA_PARAMETERS="-XX:+UseG1GC -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -Dfml.readTimeout=512" \
    MIN_RAM="512M" MAX_RAM="2048M" JAR_FILE="minecraft-server.jar"

VOLUME /minecraft

EXPOSE 25565
EXPOSE 25575

CMD exec java -server -Xms${MIN_RAM} -Xmx${MAX_RAM} ${JAVA_PARAMETERS} -jar ${JAR_FILE} nogui