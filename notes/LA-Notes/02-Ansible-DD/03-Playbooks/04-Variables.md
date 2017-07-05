# Variables Inclusion

- As like in programming we can include and use variables in Ansible Playbooks
- We have 2 ways of doing this
	- `vars` section : We can declare our variables in this section and can later call those variables within our playbook
	- `vars_files` section : We can declare our variables in a file and can give the location of the file in this section
- One thing we should remember reg. this is we have to declare the `vars` or `vars_files` section before declaring the tasks
- Also we can have both `vars` and `vars_files` in a playbook
- We can also add some configs
- Let us create a conf directory and create the below files

```
# cd ANSI-Plays && mkdir conf && cd conf
```

- copyright.yml

```
---
message: Copyright 2017 by Linux Library
author: Arjun Shrinivas
```

- webdefaults.yml

```
---
apache_version: 2.6
apache_mod_req: mod_ssl
```

- We can now create a new playbook

```
--- # Playbook - 05 - Variables Demo
- hosts: web
  user: ansible
  sudo: yes
  connection: ssh
  gather_facts: no
  vars:
    playbook_version: 0.1
  vars_files:
    - conf/copyright.yml
    - conf/webdefaults.yml
  vars_prompt:
    - name: web_domain
      prompt: Web Domain
```
