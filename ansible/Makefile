.DEFAULT_GOAL := help

INVENTORY ?= inventory

# Porcelain
# ###############
.PHONY: just-dotfiles
just-dotfiles:
	ansible-playbook -l local --inventory=$(INVENTORY) just_dotfiles.yml --skip-tags='pkg,nix' --extra-vars "dotfiles_binary=`which dotfiles` ansible_python_interpreter=`which python`"

# Utilities
# ###############
.PHONY: help todo init
init: ## one time setup
	direnv allow .

todo: ## list all TODOs in the project
	git grep -I --line-number TODO | grep -v 'list all TODOs in the project' | grep TODO
.PHONY: help

help: ## print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
