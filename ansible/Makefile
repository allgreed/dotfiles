.DEFAULT_GOAL := test
.PHONY: main test prepare_test

main: galaxy_roles
	./run
test: galaxy_roles
	ansible-playbook -i test_inventory testbook.yml
prepare_test: galaxy_roles
	ansible-playbook -i test_inventory playbook.yml


galaxy_roles: requirements.yml
	ansible-galaxy install -r requirements.yml --roles-path galaxy_roles
