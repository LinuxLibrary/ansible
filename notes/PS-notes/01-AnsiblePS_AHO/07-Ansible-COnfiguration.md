# Ansible Configuration

- While executing the adhoc commands or plays against any environment through ansible, then at first it looks at the ansible configuration
- Below are the places where ansible checks for the comfig files
	- Checks for `$ANSIBLE_CONFIG`
	- Checks in the current directory for `ansible.cfg` file
	- Checks in the home directory of the executing user `~/.ansible.cfg`
	- Checks for the global config file `/etc/ansible/ansible.cfg`
- These config files will not be merged.
- Ansible checks for the config file in the above order and if find a file then it stops looking at the other locations
- Overriding the environment variables
	- If you want to override an environment variable then you need to prefix the variable to be used in ansible as `ANSIBLE_`
