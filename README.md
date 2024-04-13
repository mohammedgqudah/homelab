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
