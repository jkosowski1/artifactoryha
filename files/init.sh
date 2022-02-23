#!/bin/sh
. ./set_environment.sh
cd environments/$1
terraform init -reconfigure

