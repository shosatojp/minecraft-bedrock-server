FROM ubuntu:18.04
ARG VERSION
SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y unzip curl

WORKDIR /data

RUN curl -o server.zip \
    $(curl -s https://www.minecraft.net/en-us/download/server/bedrock | grep serverBedrockLinux | sed -E 's|.*href="(.*?\.zip)".*|\1|')
RUN unzip server.zip

RUN mv server.properties whitelist.json /etc
RUN ln -s /home/whitelist.json . && \
    ln -s /home/server.properties . && \
    ln -s /home/worlds .

RUN chmod 777 /data /home
CMD cp -n /etc/whitelist.json /home && \
    cp -n /etc/server.properties /home && \
    mkdir -p /home/worlds && \
    LD_LIBRARY_PATH=. ./bedrock_server
EXPOSE 19132/udp