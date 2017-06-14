# Ansible Plays and Playbooks

- A playbook can have multiple plays
- A play can have multiple tasks
- A play maps hosts to tasks or set of tasks
- Playbooks are written in YAML
- While writtin the Playbooks in YAML be sure of the indentation and whitespace
- Let us see some of the declarations in the playbooks of some plays
- Global declaration: which is a declaration of the host(s) / group(s) the play should run against

	```
	- hosts: webservers
	  remote_user: root
	  tasks:
	```

- Declaring play specific vars
	
	```
	vars:
	  git_repo: https://github.com/mytestrepo.git
	  http_port: 8080
	  db_name: myblog
	```

- Declaration of user to run tasks

	```
	sudo: yes
	sudo_user: arjun
	```

# Tasks

- While declaring the task please declare in the order of the process.
- Tasks will always executed in the order we declare
- Be sure to name the tasks so that we can know what is going on on the execution also it will give readability for the user
- Let us see an example task

```
tasks:
  - name: Install Apache
    yum: name=httpd state=latest
  - name: Deploy Apache Configuration File
    copy: src=/GitHub/ansible/configs/ACS/files/conf/httpd.conf
          dest= /etc/httpd/conf
```

- To execute a playbook we need to use `ansible-playbook` command

```
# ansible-playbook playbook.yml
```
