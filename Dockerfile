FROM openjdk:11-jre-slim

ARG site_url=https://bubblesoftapps.com/bubbleupnpserver
ARG pkg=bubbleupnpserver_0.9-6_all.deb

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends wget ffmpeg && \
    wget ${site_url}/${pkg} && \
    apt-get install -y ./$pkg && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm $pkg && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 58050/tcp 58051/tcp 1900/udp

ENTRYPOINT [ "/opt/bubbleupnpserver/launch.sh" ]

