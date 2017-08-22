#!/bin/bash
# Author : Arjun Shrinivas
# Purpose : This script is used to add "ansible" user and to make the SSH configs

echo "Execute this as ROOT user only!"
useradd -m ansible
passwd -d ansible
echo -e "\nansible\tALL=(ALL)\tNOPASSWD:ALL" >> /etc/sudoers
echo -e "AuthorizedKeysFile %h/.ssh/authorized_keys" >> /etc/ssh/sshd_config
echo -e "RSAAuthentication yes\nPasswordAuthentication yes\nIdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config

service ssh restart || service sshd restart

# END
