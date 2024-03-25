#!/bin/bash
ansible-playbook install-traefik.yml --tags "production-install"
ansible-playbook install-cert-manager.yml --tags "production-install"
ansible-playbook install-rancher-ui.yml --tags "production-install"
ansible-playbook install-longhorn.yml --tags "production-install"
ansible-playbook install-gitlab.yml --tags "production-install"