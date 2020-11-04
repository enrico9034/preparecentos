for mount in $(mount | grep tmpfs | grep '/var/lib/kubelet' | awk '{​ print $3 }​') /var/lib/kubelet /var/lib/rancher; do umount $mount; done
docker stop $(docker ps -aq)
docker image rm $(docker image ls -q)
docker rm -f $(docker ps -qa)
docker volume rm $(docker volume ls -q)
cleanupdirs="/etc/ceph /etc/cni /etc/kubernetes /opt/cni /opt/rke /run/secrets/kubernetes.io /run/calico /run/flannel /var/lib/calico /var/lib/etcd /var/lib/cni /var/lib/kubelet /var/lib/rancher/rke/log /var/log/containers /var/log/kube-audit /var/log/pods /var/run/calico"
for dir in $cleanupdirs; do
  echo "Removing $dir"
  rm -rf $dir
done
