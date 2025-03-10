# Setup

## Virtual environment using `uv`
```
uv sync
source .venv/bin/activate
```

## Setup the nodes
```
ansible-galaxy collection install -r requirements.yml
ansible-playbook playbooks/setup-k8s-node.yml -i inventory/hosts -K
```
