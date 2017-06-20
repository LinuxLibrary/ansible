# Ansible Playbook Structure with YAML

- Below is a sample playbook written in YAML for installing and restarting HTTPD on CentOS 7 nodes

```
--- # This is a structural YAML example to install HTTPD on CentOS
- hosts: web1
  remote_user: ansible
  become: yes
  become_method: sudo
  connection: ssh
  gather_facts: yes
  vars:
    username: arjun
  tasks:
    - name: Install HTTPD server on CentOS7 Nodes
      yum:
        name: httpd
        state: latest
      notify:
      - startservice
  handlers:
    - name: startservice
      service:
        name: httpd
        state: restarted
```
