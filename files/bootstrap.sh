#!/bin/bash
echo "Checking for docker"
DOCKER_BIN=$(which docker)
if [ -x "$DOCKER_BIN" ]; then echo "WE HAVE DOCKER!"
else
echo "Trying to yum install docker"
yum install -y docker python3
pip3 install docker
fi
systemctl enable docker
systemctl start docker
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux
if [ $? -eq 0 ];then echo "Docker is ready"; fi
echo "Install python3 and docker-py"
priv_ip=$(ip addr |grep 172.16.1 |grep eth1 |awk '{print $2}' |cut -f 1 -d "/")
echo "PRIVATE_IP=${priv_ip}" > /etc/environment
