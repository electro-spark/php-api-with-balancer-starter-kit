#!/bin/bash

dir_path="$(dirname "${BASH_SOURCE[0]}")"
cd $dir_path
  ansible-playbook -v -i ./inventories/inventory.yml ./playbooks/stop.yml
cd -
