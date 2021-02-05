#!/bin/bash
echo "Running fileupsvc deployment NOW!"
vagrant up
ansible-playbook playbooks/runserviceA.yml
ansible-playbook playbooks/runserviceB.yml
ansible-playbook playbooks/nginx.yml
ansible-playbook playbooks/statuscheck.yml
echo "---Deployment complete---"

