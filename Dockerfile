FROM ubuntu:latest

ENV MINECRAFT_VERSION=1.16.201.02

WORKDIR /home/minecraft

RUN apt-get update && apt-get install -y curl unzip gettext
RUN curl -o be.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-${MINECRAFT_VERSION}.zip
RUN unzip be.zip && rm be.zip

ENV SERVER_NAME="Dedicated Server by Docker"
ENV GAMEMODE="survival"
ENV DIFFICULTY="normal"
ENV ALLOW_CHEATS="false"
ENV MAX_PLAYERS="10"
ENV ONLINE_MODE="true"
ENV WHITE_LIST="false"
ENV SERVER_PORT="19132"
ENV SERVER_PORTV6="19133"
ENV VIEW_DISTANCE="32"
ENV TICK_DISTANCE="4"
ENV PLAYER_IDLE_TIMEOUT="30"
ENV MAX_THREADS="8"
ENV LEVEL_NAME="Bedrock level"
ENV LEVEL_SEED=""
ENV DEFAULT_PLAYER_PERMISSION_LEVEL="member"
ENV TEXTUREPACK_REQUIRED="false"

EXPOSE 19132 19133

COPY docker-entrypoint.sh /home/minecraft/docker-entrypoint.sh
ENV LD_LIBRARY_PATH=/home/minecraft

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["./bedrock_server"]
