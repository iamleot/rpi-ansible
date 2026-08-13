.POSIX:

ANSIBLE_LINT = ansible-lint
ANSIBLE_PLAYBOOK = ansible-playbook
YAMLLINT = yamllint

all:

yamllint:
	@echo "Linting YAML"
	@${YAMLLINT} .

syntax-check:
	@echo "Checking Ansible playbooks syntax"
	@find . -type f -and -name 'playbook.yml' -exec ${ANSIBLE_PLAYBOOK} --syntax-check {} +

ansible-lint:
	@echo "Linting Ansible playbooks"
	@${ANSIBLE_LINT}

check: yamllint syntax-check ansible-lint

run:
	@echo "Run Ansible playbook"
	@${ANSIBLE_PLAYBOOK} --verbose playbook.yml
