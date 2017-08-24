#!/bin/bash
# Author: Arjun Shrinivas


# Install GIT and ANSIBLE
sudo yum update && sudo yum install -y git python python-setuptools && easy_install pip && pip install ansible

# Clone Repo
if [[ $(git version) ]] 
then
	cd /tmp && git clone https://github.com/LinuxLibrary/ansible.git
	cd /tmp/ansible/ANSI-PBs && cp -prv web-ha ~/web-ha
fi

if [[ $(ansible --version) && -f ~/web-ha/web-ha.yml ]]
then
	ansible-playbook -i hosts web-ha.yml
fi

