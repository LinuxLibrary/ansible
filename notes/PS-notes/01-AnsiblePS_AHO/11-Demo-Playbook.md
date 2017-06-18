# Demo Playbook

- Let us see how to build a playbook for executing mulpiple plays
- Below are the list of tasks we want to execute
	- Add a play to install webserver
	- Add a play to install DBServer
	- Add a play to start services
	- Fail a play
	- Retry a failed play

- Below are my ansible config, inventory and playbook files
	- Ansible Config

	```
	[defaults]
	hostfile = inventory
	```

	- Inventory

	```
	acs ansible_ssh_host=192.168.1.150
	web1 ansible_ssh_host=192.168.1.151
	db1 ansible_ssh_host=192.168.1.152
	
	[webservers]
	web1
	
	[dbservers]
	db1
	
	[datacenter:children]
	webservers
	dbservers
	
	[datacenter:vars]
	ansible_ssh_user=vagrant
	ansible_ssh_pass=vagrant
	```

	- Playbook
	
	```
	---
	- hosts: webservers
	  sudo: yes
	
	  tasks:
	  - name: Ensure Apache is installed
	    yum: name=httpd state=present
	
	  - name: Start Apache Service
	    service: name=httpd enabled=yes state=started
	
	- hosts: dbservers
	  sudo: yes
	
	  tasks:
	  - name: Ensure MySQL installed
	    yum: name=mysql-server state=present
	
	  - name: Start MySql Service
	    service: name=mysqld enabled=yes state=started
	
	- hosts: webservers:dbservers
	  sudo: yes
	
	  tasks:
	  - name: Stop IPTABLES
	    service: name=iptables state=stopped
	```

- Lets execute this playbook

```
# cd /ansible/configs/PS-Configs/03-Playbooks
# ansible-playbook web_db.yaml
```

- Now think that we have some problem reaching the DBServers group due to some issue. Whenever a playbook is unable to reach then ansible will create a retry file in the hose directory of the user from which we are executing the play as `<PLAYBOOK>.retry`. This will contains the list of hosts unreachable in that group
- Once after fixing the issues connecting the host(s) group then try the below

```
# ansible-playbook <PLAYBOOK> --limit @/home/<USER>/<PLAYBOOK>.retry
```

# Playbook Controls

- Let us see some conditional based playbooks and executions
- Below is the list of tasks for that
	- Add install decision based on OS
	- Create template for Apache config
	- Deploy configuration
	- Restart service if needed
- Below is the final playbook with all my requirements

```
---
- hosts: webservers
  sudo: yes
  vars:
    http_port: 80
    doc_dir: /ansible
    doc_root: /var/www/html/ansible
    max_clients: 5
  vars_prompt:
    - name: username
      prompt: What is your name? What is your Quest? What is your fav color?

  tasks:
  - name: Ensure Apache is installed
    yum: name=httpd state=present
    when: ansible_os_family == "RedHat"

  - name: Start Apache Service
    service: name=httpd enabled=yes state=started

  - name: Deploy Apachec Configuration File
    template: src=templates/httpd.j2 dest=/etc/httpd/httpd.conf
    notify: 
      - Restart Apache

  - name: Copy Site Files
    template: src=templates/index.j2 dest={{ doc_root }}/index.html

  handlers: 
    - name: Restart Apache
      service: name=httpd state=restarted

- hosts: dbservers
  sudo: yes

  tasks:
  - name: Ensure MySQL installed
    yum: name=mysql-server state=present
    when: ansible_os_family == "RedHat"

  - name: Start MySql Service
    service: name=mysqld enabled=yes state=started

- hosts: webservers:dbservers
  sudo: yes

  tasks:
  - name: Stop IPTABLES
    service: name=iptables state=stopped
```
