# create-private-cloud

A curated stacks to bootstrap a private cloud with ease

- [create-docker-host-ec2](create-docker-host-ec2)
- [Rancher](#rancher)
- [Drone](drone)

## Rancher

Rancher is a complete container management platform.

Run on docker host to start rancher server

```
sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:stable
```

It only takes a few minutes for the Rancher server to start up. The Rancher user interface is published on port 8080 by default, and can be accessed at http://host_ip:8080. Once Rancher has successfully been installed, the user interface will guide you through adding your first compute node and container.
