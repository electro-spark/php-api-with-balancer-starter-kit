#!/bin/bash

dir_path="$(dirname "${BASH_SOURCE[0]}")"
cd $dir_path
  ansible-playbook -i ./inventories/inventory.yml ./playbooks/update.yml
cd -
