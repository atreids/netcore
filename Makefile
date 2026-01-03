ping:
	ansible -m ping homelab

provision:
	ansible-playbook playbook.yml --ask-become-pass --ask-vault-pass

provision-pve:
	ansible-playbook pve-playbook.yml --ask-become-pass --ask-vault-pass

vault-decrypt:
	ansible-vault decrypt group_vars/vault.yml

vault-encrypt:
	ansible-vault encrypt group_vars/vault.yml

