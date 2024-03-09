# Automated build of HA k3s Cluster with `kube-vip` and MetalLB forked from techno-tim/k3s-ansible repo.

After watching a couple Techno Tims excelent videos on k3s, I decided to add a couple of my own tasks to the existing project that deploys and resets the k3s cluster.
## Here is a list of Roles I have added to Techno Tims k3s-ansible project 
- [Building VMs from an Ubuntu cloud-init template in Proxmox](https://technotim.live/posts/cloud-init-cloud-image/)
- Destroying the VMs and deleting from Proxmox
- [Deploying Traefik on to k3s](https://technotim.live/posts/kube-traefik-cert-manager-le/)
- Deploying Nautobot on the k3s
- [Deploying cert manager on k3s and configuring staging and production certificates](https://technotim.live/posts/kube-traefik-cert-manager-le/)

I added an inventory.yml file, I like my inventories in yaml format, in the yaml inventory proxmox vmids are added as a host variable.

## Nautobot
I use this tool pretty extensivly with work and my home lab. If you do not know about it you should check out this project managed by [NetworktoCode](https://docs.nautobot.com/projects/core/en/stable/)

## Things I am working on
In the roles I have added I am working on adding some validation steps to the certificate tasks.

## Thanks 🤝

This repo is really standing on the shoulders of giants. Thank you to all those who have contributed and thanks to these repos for code and ideas:

- [k3s-io/k3s-ansible](https://github.com/k3s-io/k3s-ansible)
- [geerlingguy/turing-pi-cluster](https://github.com/geerlingguy/turing-pi-cluster)
- [212850a/k3s-ansible](https://github.com/212850a/k3s-ansible)
- [techno-tim/k3s-ansible](https://github.com/techno-tim/k3s-ansible)