ping:
	ansible -m ping netcores

provision-netcore-backup:
	ansible-playbook netcore-backup-playbook.yml --ask-become-pass --ask-vault-pass

provision-netcore:
	ansible-playbook netcore-playbook.yml --ask-become-pass --ask-vault-pass

vault-decrypt:
	ansible-vault decrypt group_vars/vault.yml

vault-encrypt:
	ansible-vault encrypt group_vars/vault.yml
