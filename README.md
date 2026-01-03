# Netcore

Netcore provides part of the core networking services of my homelab:

- A DNS adblocker (Pi-Hole)
- A recursive DNS server (Unbound)

This repo contains ansible playbooks + roles for netcore setup. 

## Prerequisites

- A Debian 13+ server (Works on Raspberyy Pi OS too) that you have SSH access to.
- Ansible installed.

## Provision

> Check IP/Domains and username's in the [inventory](./inventory.yml) are correct.

Simply run:

* `make provision-netcore`
* `make provision-netcore-backup`

## Manual steps required

For the Pi-hole you still have to manually add any additional block lists (see [blocklists](./blocklists.txt)) and then update the Gravity DB. Also, any reverse servers (otherwise known as conditional forwarding) needs to be enabled (See [list](rev_servers)).

You may also want to add some local DNS entries into the Pi-hole dashboard for certain network devices (e.g managed switches that are not auto discovered via DHCP).

## Vault management

Vault can be encrypted/decrypted using:

* `make vault-encrypt`
* `make vault-decrypt`

## General Steps

- Updates all packages.
- Installs & enables NetworkManager
- Disable root login via SSH.
- Installs some common defaults. `git, vim, htop, curl, wget`.
- Installs and starts Docker.
- Installs and configures UFW firewall.
- Installs and starts Fail2Ban
- Installs and starts Unbound.
- Installs and starts Pi-hole.

## Exposed ports

The server's firewall will deny all incoming traffic except on ports:

- 22 (SSH)
- 80 (HTTP access to Pi-hole console)
- 443 (HTTPS access to Pi-hole console)
- 53 (Incoming DNS requests to Pi-hole FTL server)

Internally Unbound will be listening on port 5335. Pi-hole will foward all requests to Unbound and Unbound will perform an encrypted DNS lookup using Cloudflare via port 853.
