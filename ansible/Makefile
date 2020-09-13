.DEFAULT_GOAL := help

INVENTORY := inventory
TAGS := ''

.PHONY: all some test just-dotfiles
all: galaxy_roles ## full run, with all the bells and whistles
	ansible-playbook -K -l local --inventory=$(INVENTORY) playbook.yml
some: galaxy_roles ## run main playbook with only the stuff specified in TAGS (default: run nothing)
	ansible-playbook -K -l local --inventory=$(INVENTORY) --tags=$(TAGS) --skip-tags='pkg' playbook.yml

test: galaxy_roles ## legacy
	ansible-playbook  -K -l local --inventory=$(INVENTORY) testbook.yml

galaxy_roles: requirements.yml
	ansible-galaxy install -r requirements.yml --roles-path galaxy_roles

just-dotfiles:
	sudo ln -s `which python3` /usr/bin/python
	-ansible-playbook -l local --inventory=$(INVENTORY) just_dotfiles.yml --skip-tags='pkg,nix,hax' --extra-vars "dotfiles_binary=`which dotfiles`"
	sudo rm -f /usr/bin/python

.PHONY: help
help: ## print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
