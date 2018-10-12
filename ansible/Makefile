.DEFAULT_GOAL := test
.PHONY: main test prepare_test

main:
	./run
test:
	ansible-playbook -i test_inventory testbook.yml
prepare_test:
	ANSIBLE_REMOTE_USER=root ansible-playbook -i test_inventory playbook.yml
