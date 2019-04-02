.DEFAULT_GOAL := help

INVENTORY := inventory

.PHONY: main test
main: galaxy_roles
	ansible-playbook -K -l local --inventory=$(INVENTORY) playbook.yml
test: galaxy_roles
	ansible-playbook  -K -l local --inventory=$(INVENTORY) testbook.yml


.PHONY: remote-test remote remote-dotfiles
remote-test: galaxy_roles
	ansible-playbook --inventory=test_inventory testbook.yml
remote: galaxy_roles
	ansible-playbook --inventory=test_inventory playbook.yml
remote-dotfiles: galaxy_roles
	ansible-playbook --inventory=$(INVENTORY) playbook.yml


galaxy_roles: requirements.yml
	ansible-galaxy install -r requirements.yml --roles-path galaxy_roles

.PHONY: help
help: ## print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
