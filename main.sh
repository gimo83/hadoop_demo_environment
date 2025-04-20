#!/bin/env bash
#
#

############################################
#     Run terraform
############################################
cd terraform
terraform  apply



############################################
#     Run ansible-playbook
############################################
ansible-playbook -i ansible/hosts.ini  ansible/main.yaml


