#!/bin/bash

# Install GIT and ANSIBLE
sudo yum update -y
sudo yum install -y epel-release 
sudo yum update -y
sudo yum install git ansible -y

# Clone Repo
if [[ $(git version) ]] 
then
	cd /tmp && git clone https://github.com/LinuxLibrary/ansible.git
	cd /tmp/ansible/ANSI-PBs && cp -prv web-ha ~/web-ha
fi

if [[ $(ansible --version) && -f ~/web-ha/web-ha.yml ]]
then
	cd ~/web-ha && ansible-playbook -i hosts web-ha.yml
fi
