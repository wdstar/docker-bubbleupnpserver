FROM arm32v7/debian:stable-slim

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends wget && \
    wget -O - http://ipkg.nslu2-linux.org/optware-ng/bootstrap/buildroot-armeabihf-bootstrap.sh | sh && \
    /opt/bin/ipkg install bubbleupnpserver-installer && \
    /opt/bin/bubbleupnpserver stop && \
    chmod 755 /opt/share/bubbleupnpserver/launch.sh && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 58050/tcp 58051/tcp 1900/udp

ENV JAVA_HOME /opt/lib/jvm/openjdk7/jre

ENTRYPOINT ["/opt/share/bubbleupnpserver/launch.sh"]

