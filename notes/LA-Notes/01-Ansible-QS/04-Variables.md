# Ansible Variable Substitution

- Below is the playbook I am using for this example

```
--- # Testing how variables work in the vars section of a playbook
- hosts: '{{ myhost }}'
  remote_user: ansible
  become: yes
  become_method: sudo
  connection: ssh
  gather_facts: '{{ gather }}'
  vars:
    myhost: web1
    gather: yes
    pkg: telnet
  tasks:
    - name: '{{ pkg }}'
      state: latest
```

- We can execute this playbook as is.
- We also can give the variables at runtime rather than mentioning it in the playbook. This can be done by using the `--extra-vars` option.
- Below is the sample playbook for this and the execution method

```
--- # Testing how variables work in the vars section of a playbook
- hosts: '{{ myhost }}'
  remote_user: ansible
  become: yes
  become_method: sudo
  connection: ssh
  gather_facts: '{{ gather }}'
  tasks:
    - name: '{{ pkg }}'
      state: latest
```

```
# ansible-playbook vartest2.yaml --extra-vars "myhost=web1 gather=yes pkg=telnet"
```
