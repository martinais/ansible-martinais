INVENTORY=prod

CMD=ansible-playbook -i inventory.$(INVENTORY).ini

check:       ## Play the recipe without modifiations
	$(CMD) tic.yml --check --diff

apply:       ## Play the recipe with modifications
	$(CMD) tic.yml

backup:	     ## Backup nextcloud datas
	$(CMD) backup.yml

help:
	@sed -n 's/\(^[a-z]*:\)[ a-z\.]*##\(.*\)/\1 \2/p' $(MAKEFILE_LIST)
