# Basic Include Statement in Ansible

- We can use the `include` directive in Ansible 
- Using this directive we can call the roles, tasks, etc.
- We can isolate the roles/tasks and can call them in the playbook we workk on.
- Let us create a play for the tasks 

```
# mkdir plays && cd $_
# vi packages.yml

- name: Install Apache
  yum: name=httpd state=latest
- name: Install Lynx
  yum: name=lynx state=latest
```

- Now let us create a playbook and call the above play

```
--- # BASIC INCLUDE PLAYBOOK EXAMPLE
- hosts: web
  user: ansible
  sudo: yes
  connection: ssh
  gather_facts: no
  tasks:
  - include: plays/packages.yml
  - name: Verify telnet installed
    shell: yum list installed | grep telnet > /home/ansible/pkgs.log
...
```
