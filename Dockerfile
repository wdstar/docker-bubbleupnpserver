FROM arm32v7/openjdk:8-jre-slim

ARG site_url=https://launchpad.net/~bubbleguuum/+archive/bubbleupnpserver/+files
ARG pkg=bubbleupnpserver_0.9-5_all.deb

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends wget && \
    wget -O - http://ipkg.nslu2-linux.org/optware-ng/bootstrap/buildroot-armeabihf-bootstrap.sh | sh && \
    /opt/bin/ipkg install ffmpeg && \
    wget ${site_url}/${pkg} && \
    dpkg -i $pkg && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 58050/tcp 58051/tcp 1900/udp

ENTRYPOINT [ "/usr/share/bubbleupnpserver/launch.sh" ]

