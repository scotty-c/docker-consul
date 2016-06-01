FROM alpine:latest

MAINTAINER Scott Coulton "https://github.com/scotty-c/docker-consul"

RUN apk add --update curl unzip && rm -rf /var/cache/apk/* 
ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip /tmp/consul.zip
RUN cd /usr/sbin && unzip /tmp/consul.zip && chmod +x /usr/sbin/consul && rm /tmp/consul.zip
ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_web_ui.zip /tmp/webui.zip
RUN mkdir -p /usr/src/consul 
RUN cd /tmp/ && unzip webui.zip && mv index.html /usr/src/consul && mv static /usr/src/consul/ 
ADD consul.json /config/

EXPOSE 53/udp 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

VOLUME ["/data"]

ENTRYPOINT [ "/usr/sbin/consul", "agent", "-config-dir=/config", "-ui-dir",  "/usr/src/consul" ] 

CMD []
