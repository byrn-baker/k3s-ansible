#!/bin/bash
ansible-playbook install-cert-manager.yml --tags "production-install"
ansible-playbook install-traefik.yml --tags "production-install"
ansible-playbook install-rancher-ui.yml --tags "production-install"
ansible-playbook install-gitlab.yml --tags "production-install"