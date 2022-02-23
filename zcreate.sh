#!/bin/bash

export local_temp_dir="arti_automated"
export tf_temp_dir="tf_files"

export ansible_debug=""
export ansible_debug="-vvv"

current_dir=`pwd`

while [[ $# > 0 ]]; do
  ansible-playbook -i inventories/$1.hosts create_terraform_files.yml $ansible_debug

  cd ../$local_temp_dir/$tf_temp_dir
  ./init.sh $1
  ./create.sh $1

#  cd $current_dir
#  export k8s_cert_dir="$local_temp_dir/k8s_certs/$1"
#  ansible-playbook -i inventories/$1.hosts ./create_k8s_certs.yml $ansible_debug # -e "recreate_certs=true"
#  ansible-playbook -i inventories/$1.hosts ./configure_k8s_nodes.yml  $ansible_debug
  shift
done
