# docker-bubbleupnpserver

## Architectures 

- amd64: https://github.com/wdstar/docker-bubbleupnpserver
- armhf: https://github.com/wdstar/docker-bubbleupnpserver/tree/armhf
- armhf-optware-ng: https://github.com/wdstar/docker-bubbleupnpserver/tree/armhf-optware-ng

## Usage

- Build image.

```
$ docker-compose build
```

- Start BubbleUPnP Server.

```
$ touch data/configuration.xml
$ docker-compose up -d
```

- Access `http://localhost:58050/`

