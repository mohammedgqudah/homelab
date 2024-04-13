# Homelab
This contains configuration for my servers.

## DNS
I plan to use dnsmasq once I add more servers.
But for now, I'm reserving a private IP address for each machine in the DHCP server and adding a static DNS entry in the router, formatted as `<hostname>.home`.

---

# Setup

## Ansible
Create the vault password file and write the password.

```
vim ./ansible/.vault_pass.txt
```

```
ansible-playbook playbooks/install-common.yml -K
ansible-playbook playbooks/deploy-monitoring.yml -K
```
Prometheus alertmanager rules are configured under `roles/prometheus/rules/*.rules`

# Screenshots
_Node Exporter Full_

<img width="2242" alt="node exporter full dashboard" src="https://github.com/mohammedgqudah/homelab/assets/26502088/7bb0784b-2c8a-454b-aab8-580d0daef6e4">

_Discord #alerts_

<img width="535" alt="alertmanager discord webhooks" src="https://github.com/mohammedgqudah/homelab/assets/26502088/bebca6d2-cb39-400b-a02f-233ba9cd56f2">

