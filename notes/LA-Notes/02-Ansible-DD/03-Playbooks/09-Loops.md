# Loops in Ansible

- Likewise we loop through or iterate through list of values and do something required in other languages, we also can do the same in Ansible as well
- `with_items` directive helps us to declares our list of values
- After declaring the values we can call those in a task
- For example let us see how to create a list of 3 users
- Below is the example of that task

```
- name: Add a list of users
  user: name={{ item }} state=present
  with_items:
  - user1
  - user2
  - user3
```

- Below is the playbook of this example

```
--- # LOOPS PLAYBOOK EXAMPLE
- hosts: web
  user: ansible
  sudo: yes
  connection: ssh
  gather_facts: no
  tasks:
  - name: Add a list of users
    user: name={{ item }} state=present
    with_items:
    - user1
    - user2
    - user3
...
```
