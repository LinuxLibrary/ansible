# Ansible Modules

- These are the building blocks that make automation
- There are 462 different modules that are included in the ansible distribution at current
- We also can create our own modules
- There are 3 types of modules
	- Core
		- These are the modules that are supported by Ansible
	- Extras
		- These are which have been created by other companies which are included in the distribution and sometimes may not be supported by ansible
	- Deprecated
		- These are the modules which are being replaced by a new module or pulled of ansible and will not be available
- We can use the documentaion of the Modules locally on the ansible machine using the following command

```
# ansible-doc -l		--> Lists the documentaion of all the available modules
# ansible-doc <MODULE_NAME>	--> Display the documentation of a specific module
# ansible-doc <MODULE_NAME> -s	--> Gets the playbook example of the module
```

- These commands will work like the UNIX man pages of ansible modules
- Through these commands we can reference the modules quickly

# Module Categories

- Below are the most commonly used Module categories
	- Manage Servers
	- Deploy Configurations
	- Configure Network Equipment
	- Maintain Virtual Servers
	- Manage Database and Tables
	- Deploy load-balancer configurations

- Let us see some of the commonly used modules
- Copy Module
	- Copies a file from local machine to a remote machine
	- Has `backup` capability
	- Can do validation remotely
- Fetch Module
	- Pulls a file from remote machine to local machine
	- Can use MD5 checksum to validate
- APT Module
	- Manages installed application on Debian Based Systems
	- Can install, update, or delete packages
	- Can update entire system
- YUM Module
	- Manages installed application on RedHat Based Systems
	- Can install, update, or delete packages
	- Can update entire system
- Service Module
	- Can stop, start or restart services
	- Can enable services to start on boot
