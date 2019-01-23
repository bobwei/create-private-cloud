#!/bin/bash

# fix /etc/resolv.conf permission
chattr -i /etc/resolv.conf

# load additional modules
cat <<EOF > /etc/modules-load.d/additional-modules.conf
rbd
iscsi_tcp
EOF

# install docker-ce 17.03
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y --setopt=obsoletes=0 docker-ce-17.03.2.ce-1.el7.centos

# configure docker daemon settings
mkdir -p /etc/docker
cat <<EOF > /etc/docker/daemon.json
{
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF

# start docker and run on startup
systemctl enable docker
systemctl start docker

# user permissions

sudo /usr/sbin/usermod -aG docker $USER && \
sudo su - $USER

# enable ip forwarding
echo "net.ipv4.ip_forward = 1" > /etc/sysctl.d/99-ip-forward.conf
