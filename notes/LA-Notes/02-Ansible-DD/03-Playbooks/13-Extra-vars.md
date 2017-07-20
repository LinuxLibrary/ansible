# Passing variables at command line

- We have seen how to declare and use the variables
	- Through `vars` section
	- Through `vars_files` section
	- Through `vars_prompt` section
- Now we also have another way
	- Through `extra-vars` directive at the command line while running the playbook
	- All we need to do is to just call the variables and declare the variables at the runtime as like we provide the arguments for any other programming languages
	- Below is an example playbook

	```
	--- # PASSING VARIABLES AT COMMAND LINE
	- hosts: '{{ hosts }}'
	  user: '{{ user }}'
	  sudo: yes
	  connection: ssh
	  gather_facts: yes
	  tasks:
	  - name: Install mentioned package
	    yum: name={{ pkg }} state=latest
	...
	```

	- Now run the playbook as below

	```
	# ansible-playbook 21-extra-vars.yml --extra-vars "hosts=web user=ansible pkg=telnet"
	```
