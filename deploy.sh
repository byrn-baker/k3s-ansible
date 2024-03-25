#!/bin/bash
echo "What Prox node do you want to deploy on?"
read node

echo "What Prox template do you want to use (Prox Template VMID)?"
read template_id

echo "Do you want a staging installation or a production installation? (Enter 'staging-install' or 'production-install')"
read installation_type

ansible-playbook deploy-k3s-vms.yml -e "node=$node template_id=$template_id"
ansible-playbook site.yml
ansible-playbook install-traefik.yml --tags "$installation_type"
ansible-playbook install-cert-manager.yml --tags "$installation_type"
ansible-playbook install-rancher-ui.yml --tags "$installation_type"
ansible-playbook install-longhorn.yml --tags "$installation_type"
ansible-playbook install-gitlab.yml --tags "$installation_type"
ansible-playbook install-opnsense-host-overrides.yml