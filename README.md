# create-private-cloud

A curated stacks to bootstrap a private cloud with ease

- [Rancher](#rancher)
- [Drone](drone)


## Rancher

Rancher is a complete container management platform.

- [Install Docker](#install-docker)
- [Install Rancher](#install-rancher)

### Install Docker

Install docker on rancher host [Install Notes](https://rancher.com/docs/rancher/v2.x/en/installation/single-node-install/#software)

```
curl https://raw.githubusercontent.com/bobwei/create-private-cloud/master/scripts/install/centos/docker/17.03.2.sh | sh
```

If you would like to use Docker as a non-root user, you should now consider adding your user to the "docker" group

```
sudo /usr/sbin/usermod -aG docker $USER && \
sudo su - $USER
```

### Install Rancher

```
docker run -d --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  rancher/rancher:latest
```


## References

- https://github.com/rancher/install-docker
