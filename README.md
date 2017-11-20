# swarm-monitoring

Docker Swarm monitoring and instrumentation with Prometheus and ELK stack  

### Prerequisites 

Docker Swarm cluster:

* Docker Engine min version 17.09
* 3 manager nodes
* 3 worker nodes
* VPC with urestricted access between nodes

Docker hosts vm map:

```bash
sudo sysctl -w vm.max_map_count=262144
sudo echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
```

Disable swap in `/etc/fstab` and run:

```bash
sudo swapoff -a
```

Grand group access to local dir bind mount:

```bash
mkdir /esdatadir
chmod g+rwx /esdatadir
chgrp 1000 /esdatadir
```

