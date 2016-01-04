FROM ubuntu:14.04

MAINTAINER Scott Coulton "https://github.com/scotty-c/docker-consul"

RUN apt-get -qqy update
RUN apt-get -qqy install curl unzip
ADD https://releases.hashicorp.com/consul/0.6.0/consul_0.6.0_linux_amd64.zip /tmp/consul.zip
RUN cd /usr/sbin && unzip /tmp/consul.zip && chmod +x /usr/sbin/consul && rm /tmp/consul.zip
ADD https://releases.hashicorp.com/consul/0.6.0/consul_0.6.0_web_ui.zip /tmp/webui.zip
RUN mkdir -p /usr/src/consul 
RUN cd /tmp/ && unzip webui.zip && mv index.html /usr/src/consul && mv static /usr/src/consul/ 
ADD consul.json /config/

EXPOSE 53/udp 8300 8301 8301/udp 8302 8302/udp 8400 8500 

VOLUME ["/data"]

ENTRYPOINT [ "/usr/sbin/consul", "agent", "-config-dir=/config", "-ui-dir",  "/usr/src/consul" ] 

CMD []