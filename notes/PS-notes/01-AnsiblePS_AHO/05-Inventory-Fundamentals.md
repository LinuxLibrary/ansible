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
	[dc-east:children]
	[app]
	app01.linux-library.com
	app03.linux-library.com
	
	[web]
	web01.linux-library.com

	[db]
	db01.linux-library.com

	[dc-west:children]
	[app]
	app02.linux-library.com
	app04.linux-library.com

	[web]
	web02.linux-library.com

	[db]
	db02.linux-library.com
	```

- Also we can create the `vars` on group basis

	```
	[dc-east:vars]
	ansible_ssh_user=ansible
	ansible_ssh_pass=ans!p@$$
	```
