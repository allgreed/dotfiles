.DEFAULT_GOAL := test
.PHONY: main test prepare_test

main: galaxy_roles
	ansible-playbook -K -l local -i inventory playbook.yml
main-test: galaxy_roles
	ansible-playbook  -K -l local -i inventory testbook.yml
full-test: prepare-test test
test: galaxy_roles
	ansible-playbook -i test_inventory testbook.yml
prepare-test: galaxy_roles
	ansible-playbook -i test_inventory playbook.yml


galaxy_roles: requirements.yml
	ansible-galaxy install -r requirements.yml --roles-path galaxy_roles
