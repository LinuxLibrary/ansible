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

- Including files
	- Some times we might have very long playbooks and we break those into smaller chunks
	- Include function can be used to call the playbooks from another playbooks
	- It can be used to add external variables
	- Also can be used to reuse other playbooks
- Register task outputs
	- Useful to use tasks to feed data into other tasks
	- Useful to create custom error tapping
- Debug Module
	- Useful to send output to screen during execution
	- Helps find problems
- Prompting for input
	- Creates dynamic playbooks
- Handlers
	- These tasks will execute when all the other tasks in the play completes their execution
	- Tasks only notify when state=changed
	- Tasks with asynchronous execution
	- Only runs tasks when notified
	- Most common for restarting services to load changes (if changed are made)
	- Let us see an example. We want to restart Apache only when the configuration has been loaded

	```
	tasks:
	  - copy: src=files/httpd.conf
	          dest=/etc/httpd/httpd.conf
	    notify:
	      - Apache Restart

	handlers:
	  - name: Restart Apache
	    service: name=httpd state=restarted
	```

- Conditional Clauses
	- `when` Clause: This clause can be used to choose the tasks based on condition. For example while install/restart the web service we have httpd module in Redhat based systems and apache2 in debian based systems. So we need to install/restart those services according to the systems. Let us see the case of installing the webserver

	```
	tasks:
	  - name: Restart HTTPD
	    yum: name=httpd state=present
	    when: ansible_os_family == "RedHat"
	  - name: Restart Apache2
	    apt: name=apache2 state=present
	    when: ansible_os_family == "Debian"
	```

- Templates
	- Uses Jinja2 engine
	- Insert variables into static files
	- Creates and copies dynamic files
	- Deploy custom configurations
