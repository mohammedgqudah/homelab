# Homelab
A self-managed kubernetes cluster at home.

## DNS
I plan to use dnsmasq once I add more servers.
But for now, I'm reserving a private IP address for each machine in the DHCP server and adding a static DNS entry in the router, formatted as `<hostname>.local`.


---

# Setup

## Kubernetes
The cluster manifest files & guide are under kuberenets/

## Ansible
I initially used ansible to deploy a couple of services, but now everything is deployed in the kubernetes cluster.
I still however use ansible to setup the NFS server and new cluster nodes.

To start using the playbooks, create the vault password file and write the password.
```
vim ./ansible/.vault_pass.txt
```

# Screenshots
_Internal Uptime Kuma Instance_
<img width="1420" alt="image" src="https://github.com/mohammedgqudah/homelab/assets/26502088/6f86f4b8-2258-493d-897e-256779e3dff3">

_Node Exporter Full_

<img width="2242" alt="node exporter full dashboard" src="https://github.com/mohammedgqudah/homelab/assets/26502088/7bb0784b-2c8a-454b-aab8-580d0daef6e4">

