# When Condition in Ansible

- In Ansible we perform several tasks based on our requirement
- But some times we might need to run the tasks on different OS platforms
- Based on that we have to perform the tasks
- `when` condition can be used in such cases
- For example if we want to install Apache in a group of hosts which have hosts with different OS platforms (Debian/Ubuntu/CentOS/RedHat)
- For those things ansible will check the facts and based on the facts it will get the required task to run and the remaining tasks to get skipped on that host.
- Ansible checks `ansible_os_platform` directive to know the OS platform of the machine
- Below is an example of performing that task

```
  tasks:
  - name: Install Apache appropriate to the distribution type (Debian/Ubuntu)
    apt: name=apache2 state=latest
    when: ansible_os_family == "Debian"
    notify: Restart Apache2
  - name: Install Apache appropriate to the distribution type (Redhat/CentOS)
    yum: name=httpd state=latest
    when: ansible_os_family == "RedHat"
    notify: Restart HTTPD
  handlers:
  - name: Restart Apache2
    service: name=apache2 enabled=yes state=restarted
  - name: Restart HTTPD
    service: name=httpd enabled=yes state=restarted
```

- Below is the complete playbook for reference

```
--- # WHEN CONDITION PLAYBOOK EXAMPLE
- hosts: web
  user: ansible
  sudo: yes
  connection: ssh
  vars:
    playbook_type: conditional_example
  vars_files:
    - conf/copyright.yml
    - conf/webdefaults.yml
  tasks:
  - name: Install Apache appropriate to the distribution type (Debian/Ubuntu)
    apt: name=apache2 state=latest
    when: ansible_os_family == "Debian"
    notify: Restart Apache2
  - name: Install Apache appropriate to the distribution type (Redhat/CentOS)
    yum: name=httpd state=latest
    when: ansible_os_family == "RedHat"
    notify: Restart HTTPD
  handlers:
  - name: Restart Apache2
    service: name=apache2 enabled=yes state=restarted
  - name: Restart HTTPD
    service: name=httpd enabled=yes state=restarted
...
```
