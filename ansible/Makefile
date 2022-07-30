.DEFAULT_GOAL := help

# Porcelain
# ###############
.PHONY: work
work:  ## install the dotfiles and everything
	ansible-playbook -l local --inventory=inventory main.yml --extra-vars "dotfiles_binary=`which dotfiles || echo ~/.local/bin/dotfiles` link_main_git_id=yes ansible_python_interpreter=`which python`"
	@tput setaf 1; echo 'if ran for the first time on this machine I highly recommend running also `git checkout ..`'
	
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
