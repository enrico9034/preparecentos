#!/bin/bash
yum-config-manager --enable rhui-REGION-rhel-server-extras
yum -y update
yum -y install docker
chkconfig docker on
sed -i -e 's/slave/shared/g' /lib/systemd/system/docker.service
systemctl daemon-reload
service docker start
useradd dockeruser
usermod -aG docker dockeruser
mkdir /opt/cni /etc/cni
chcon -Rt svirt_sandbox_file_t /etc/cni
chcon -Rt svirt_sandbox_file_t /opt/cni
