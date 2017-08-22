# Simple variable substitution in Ansible

- We can use the variables in ansible like any other languages
- We either can declare the variables in `vars_files` or in the `vars` section or else through prompting the user
- Let us see those ways


- Through `vars_files`
	- Create a directory `conf` and create a yml file which contains the variables for your playbook

	```
	# mkdir conf && cd $_
	# vi SimpleVars.yml
	
	---
	apache_version: 2.6
	apache_mod_req: mod_ssl
	pkg_lynx: lynx
	```
	
	- Include the file in the `vars_files` section

	```
	vars_files:
	- conf/copyright.yml
	- conf/webdefaults.yml
	```

	- Call the variable

	```
	tasks:
	- name: Install Lynx browser
	  yum: name={{ pkg_lynx }} state=latest
	```

- Through `vars` section
	- Create a variable in the vars section

	```
	vars:
	  pkg_lynx: lynx
	```
	
	- Calling the variable is same in all the 3 methods

- Through prompting the user
	- Create a var prompt

	```
	vars_prompt:
	- name: pkg_lynx
	  prompt: Please input the package name of the webserver you want to install
	```

	- Call the variable
