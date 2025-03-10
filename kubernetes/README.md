# Kubernetes
Configuration and setup for my self-managed kubernetes cluster.

## Overview
As of now, my cluster consists of 3 raspberry PIs and two computers (arch & debian)

## Storage

`pi-02.local` runs an NFS server which is used as a shared storage for the cluster and is dynamically provisioned using [kubernetes-sigs/nfs-subdir-external-provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner).

To setup the NFS server run this playbook
```
ansible-playbook playbooks/setup-nfs.yml --limit pi-02.local
```
And then install the NFS provisioner using `helm`

```
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
--set nfs.server=pi-02.local \
--set nfs.path=/data/k8s_nfs
```

## Adding a new node
1. Run `setup-k8s-node.yml`
```
ansible-playbook playbooks/setup-k8s-node.yml --limit pi-03.local
```
2. Reboot the node
3. On the control plane, generate a new token
```
$ kubeadm token create --print-join-command
```
4. ssh into the node, and run the join command
```
kubeadm join <host>:<port> --token abc.qwertyu --discovery-token-ca-cert-hash sha256:<hash>
```


## Building the cluster
```
sudo kubeadm init --config=kubeadm.yml
```

### Installing calico
```
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/tigera-operator.yaml
kubectl apply -f calico/custom-resources.yml
```
