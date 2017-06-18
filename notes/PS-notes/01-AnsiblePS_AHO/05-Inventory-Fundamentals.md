# Ansible Inventory Fundamentals

- It contains the list of systems ansible talks to
- The plays we execute will be ran against the:
	- Host
	- All systems
	- Group of systems
	- Groups of groups
- We can also assign variables in the inventory file
- Inventory file can be Static / Dynamic
- Grouping hosts
	- Lets group the web hosts

	```
	[web]
	web01.linux-library.com
	web02.linux-library.com
	```

- Group of groups
	- Lets say we have 2 locations `dc-east` and `dc-west`
	- For each DC we have some groups

	```
	[app]
	app01.linux-library.com
	app02.linux-library.com
	app03.linux-library.com
	app04.linux-library.com
	
	[web-01]
	web01.linux-library.com

	[web-02]
	web02.linux-library.com

	[db-01]
	db01.linux-library.com

	[db-02]
	db02.linux-library.com

	[dc-east:children]
	web-01
	db-01

	[dc-west:children]
	web-02
	db-02
	```

- Also we can create the `vars` on group basis

	```
	[dc-east:vars]
	ansible_ssh_user=ansible
	ansible_ssh_pass=ans!p@$$
	```

- Defining hosts with name and IP in the inventory file while we don't have name resolution

	```
	web01 ansible_ssh_host=192.168.1.151 ansible_ssh_user=ansible ansible_ssh_pass=@ns!p@$$
	db1 ansible_ssh_host=192.168.1.152 ansible_ssh_user=ansible ansible_ssh_pass=@ns!p@$$
	```
	
	> NOTE: Please don't use passwords in your inventory files
