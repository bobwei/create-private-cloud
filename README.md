# create-private-cloud

A curated stacks to bootstrap a private cloud with ease

- [Rancher](#rancher)
- [Drone](drone)

## Rancher

Rancher is a complete container management platform.

- [create-private-cloud](#create-private-cloud)
  - [Rancher](#rancher)
    - [Install Docker `17.03.2.sh`](#install-docker-17032sh)
    - [Install Docker `17.03.custom.sh`](#install-docker-1703customsh)
    - [Install Rancher](#install-rancher)
  - [References](#references)

### Install Docker `17.03.2.sh`

```
curl https://raw.githubusercontent.com/bobwei/create-private-cloud/master/scripts/install/centos/docker/17.03.2.sh | sh
```

If you would like to use Docker as a non-root user, you should now consider adding your user to the "docker" group

```
sudo /usr/sbin/usermod -aG docker $USER && \
sudo su - $USER
```

### Install Docker `17.03.custom.sh`

```
curl https://raw.githubusercontent.com/bobwei/create-private-cloud/master/scripts/install/centos/docker/17.03.custom.sh | sudo sh
```

### Install Rancher

```
docker run -d --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  rancher/rancher:latest
```

## References

- https://github.com/rancher/install-docker
