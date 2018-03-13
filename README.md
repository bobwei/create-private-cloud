# create-private-cloud

A curated stacks to bootstrap a private cloud with ease

- [create-docker-host-ec2](create-docker-host-ec2)
- [Rancher](#rancher)
- [Drone](drone)

## Rancher

Rancher is a complete container management platform.

Install docker on rancher host [link](http://rancher.com/docs/rancher/v1.6/en/hosts/#supported-docker-versions)

```
curl https://releases.rancher.com/install-docker/17.12.sh | sh
```

If you would like to use Docker as a non-root user, you should now consider adding your user to the "docker" group

```
sudo /usr/sbin/usermod -aG docker $USER && \
sudo su - $USER
```

LAUNCHING RANCHER SERVER - SINGLE CONTAINER (NON-HA) [link](http://rancher.com/docs/rancher/v1.6/en/installing-rancher/installing-server/)

```
sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:stable
```

It only takes a few minutes for the Rancher server to start up. The Rancher user interface is published on port 8080 by default, and can be accessed at http://host_ip:8080. Once Rancher has successfully been installed, the user interface will guide you through adding your first compute node and container.

## Todos after launching instances

- Associate an elastic ip
- Attach corresponding security group


## Trouble Shooting

command not found on CentOS 7.4
```
service: command not found
```

```
export PATH=$PATH:/sbin
```
