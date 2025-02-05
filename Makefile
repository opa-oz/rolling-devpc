.PHONY: help

include .env
export $(shell sed 's/=.*//' .env)
MAKEFILE_LIST := Makefile

help: ## Show this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

onboard: ## Setup devpc's 
	@ansible-playbook playbooks/onboard.yaml --e "ansible_sudo_pass=$(ANSIBLE_SUDO_PASS)"

.PHONY: onboard

