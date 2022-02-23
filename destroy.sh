#!/bin/bash

export local_temp_dir="arti_automated"
export tf_temp_dir="tf_files"
export ansible_debug=""
#export ansible_debug="-vvv"

cd ../$local_temp_dir/$tf_temp_dir

while [[ $# > 0 ]]; do
  ./destroy.sh $1
  shift
done
