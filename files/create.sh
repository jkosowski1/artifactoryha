#!/bin/sh
. ./set_environment.sh
. ./set_credentialls.sh
cd environments/$1
terraform validate
terraform plan -out=plan
terraform apply -auto-approve plan
terraform output -json | jq -r '.[] .value[]' | cut -f1 -d" " | xargs -L1 ssh-keyscan >> ~/.ssh/known_hosts
terraform output -json | jq -r '.[] .value[]' | cut -f3 -d" " | xargs -L1 ssh-keyscan >> ~/.ssh/known_hosts
terraform output -json | jq -r '.[] .value[]' | cut -f3 -d" " | xargs -L1 ssh-copy-id -f
