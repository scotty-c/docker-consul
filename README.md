#Consul
scottyc/consul

Consul in a Ubuntu 14.04 docker container.

[`scottyc/consul`](https://registry.hub.docker.com/u/scottyc/consul/)

##Running

Create a Dockerfile in your project ```FROM``` scottyc/consul or go to [`scottyc/docker-consul`](https://github.com/scotty-c/docker-consul/) for docker-compose files for a clustered set up. Copy the appriopriate docker-compose.yml (mater or slave) to serperate docker hosts. Change the <$JOIN_IP> and <$IP>. If all is configured correctly it will be as easy as docker-compose run. Note you need to have [`docker-compose`](https://docs.docker.com/compose/install/) installed 

##Building
```
docker run -p 8500:8500 -p 53:53/udp -h node1 scottyc/consul -server -bootstrap (for a simple single node)

```
Then login to ```http://dockerhostip:8500```
