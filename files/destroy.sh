#!/bin/sh
. ./set_environment.sh
. ./set_credentialls.sh
cd environments/$1
terraform output -json | jq -r '.[] .value[]' | cut -f1 -d" " | xargs -L1 ssh-keygen -R
terraform output -json | jq -r '.[] .value[]' | cut -f3 -d" " | xargs -L1 ssh-keygen -R
terraform apply -destroy -auto-approve
