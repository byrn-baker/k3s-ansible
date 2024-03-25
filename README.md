# Automated build of HA k3s Cluster with `kube-vip` and MetalLB forked from techno-tim/k3s-ansible repo.

After watching a couple Techno Tims excelent videos on k3s, I decided to add a couple of my own tasks to the existing project that deploys and resets the k3s cluster.
## Here is a list of Roles I have added to Techno Tims k3s-ansible project 
- [Building VMs from an Ubuntu cloud-init template in Proxmox](https://technotim.live/posts/cloud-init-cloud-image/)
- Destroying the VMs and deleting from Proxmox
- [Deploy cert manager on k3s and configuring staging and production certificates](https://technotim.live/posts/kube-traefik-cert-manager-le/)
- [Deploying Traefik on to k3s](https://technotim.live/posts/kube-traefik-cert-manager-le/)
- Deploy Nautobot on the k3s
- Deploy Rancher UI 2.8 with the rancherLB - still trying to figure out how to get this working behind traefik.
- Deploy a self hosted gitlab behind traefik.


## Building VMs from an Ubuntu cloud-init template in Proxmox & Destroying the VMs and deleting from Proxmox
This includes some additional task of mounting NFS, or a ISCSI target. I am using the ISCSI for longhorn. This makes it easy to tear everything down and rebuild it quickly incase you hose up your cluster.

## Deploy cert manager on k3s and configuring staging and production certificates
Uses tags to just install Cert-manager via helm, as well as tags for staging (For testing all components) and production ( when you are ready to rollout your production wildcard certificates). 

## Deploying Traefik
This just takes what TechnoTim showed on his video, and customizes it a little bit to suit my needs, including enabling it for Gitlab. 

## Nautobot
I use this tool pretty extensively with work and my home lab. If you do not know about it you should check out this project managed by [NetworktoCode](https://docs.nautobot.com/projects/core/en/stable/)

## Rancher UI
In case you want to have the UI, I use it for navigating around and checking logs and deployments. Also use it to install Longhorn as well, would like to convert that over to a ansible task as well, but after I figure out how to get Rancher UI behind traefik.

## Gitlab
I like the idea of self hosting my code, so I thought it would be fun to have a local gitlab instance running. This way I can mess around with gitlab-ci and following along with [technotim](https://technotim.live/posts/self-hosted-devops-stack/). Includes ingress for both staging and production certificates.
After installation completes use the following to get your initial root password - ```kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -ojsonpath='{.data.password}' | base64 --decode ; echo```

## Installing everything
You can use the ```deploy.sh``` bash script and it will install everything listed above.

## If you install with staging it is easy to switch to your production certificate
You can use ```switch_deployment_to_production.sh``` bash script. This will flip all of the services installed to the real certificate from LetsEncrypt.

## If you would to destroy the entire deployment
To destroy the entire deployment you can use the ```destroy-k3s-vms.yml```. This will stop and remove the Proxmox VMs.



## Thanks 🤝
This repo is really standing on the shoulders of giants. Thank you to all those who have contributed and thanks to these repos for code and ideas:
- [k3s-io/k3s-ansible](https://github.com/k3s-io/k3s-ansible)
- [geerlingguy/turing-pi-cluster](https://github.com/geerlingguy/turing-pi-cluster)
- [212850a/k3s-ansible](https://github.com/212850a/k3s-ansible)
- [techno-tim/k3s-ansible](https://github.com/techno-tim/k3s-ansible)