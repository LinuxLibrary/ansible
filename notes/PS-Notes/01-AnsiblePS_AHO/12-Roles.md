# Ansible Roles

- Below is the directory structure of the Roles

```
- roles
  - builders
  - server-commons
    - defaults
    - files
    - handlers
    - meta
    - tasks
    - templates
    - vars
  - webservers
```

- Role is a subdirectory under a parent `roles` directory
- We can see the structure of the `server-commons` role which has been expanded
- Here all the directories are not mandatory. We only need the directories which we work on. 
- There is no need of mentioning the path of the directories in the playbook
- If we include the role then Ansible will automatically look for the specific directory based on the directive
- `main/yml` is the primary file that ansible looks for.
- If we have lengthy playbooks then we can split that into multiples
- We need to have another playbook besides these directories which is `site.yml` through which we can access all these by using the include directives
- Pre & Post tasks
	- Pre Tasks: Executes plays before roles. Below are the Use Cases
		- Setup of maintenance windows
		- Removing servers from load-balancers
		- Silincing alarms
	- Post Tasks: Executes plays after roles. Below are the use cases
		- Clearing maintenance window
		- Adding servers to load-balancers
		- Enabling alarms
	- Adding pre & post tasks

	```
	---
	- hosts: webservers
	  pre_tasks:
	  - # Remove from load-balancers
	  roles:
	    - server-commons
	    - jboss
	  post_tasks:
	  - # Add to load-balancers
	  gather_facts: no
	```

- Executing a role is similar to executing a normal playbook

```
# ansible-playbook site.yml
```

- While we execute a role it executes everything specified in it.
- If we don't want everything to be executed and just need some specific operations to be executed then we need to tag the tasks in the playbooks and can execute the role with the specific tag we need.

```
# ansible-playbook site.yml --tags "web"
```

- We also can use the `limit` option if we want these to be executed in some specific hosts/areas
- Let us build some roles
- Below are our tasks for that
	- Define a `webserver` role
	- Define a `dbserver` role
	- Define `common-server` role
	- Apply roles
- Visit [MyAnsibleRoles](https://github.com/LinuxLibrary/ansible/tree/master/configs/PS-Configs/04-Roles) to see the above

- Getting roles
	- If we are need of roles then we have 2 ways
		- Create own roles: Perfect for proprietary applications or workflows
		- Find roles to download: Look for others that had the same requirement and shared their work. These can be found at Ansible Galaxy
