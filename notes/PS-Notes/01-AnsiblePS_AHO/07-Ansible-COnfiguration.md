# Ansible Configuration

- While executing the adhoc commands or plays against any environment through ansible, then at first it looks at the ansible configuration
- Below are the places where ansible checks for the comfig files
	- Checks for the environment variables `$ANSIBLE_CONFIG`
	- Checks in the current directory for `ansible.cfg` file
	- Checks in the home directory of the executing user `~/.ansible.cfg`
	- Checks for the global config file `/etc/ansible/ansible.cfg`
- These config files will not be merged.
- Ansible checks for the config file in the above order and if find a file then it stops looking at the other locations
- Overriding the environment variables
	- If you want to override an environment variable then you need to prefix the variable to be used in ansible as `ANSIBLE_`

# Defaults

- Ansible Forks - `forks`
	- The total number of parallel / concurrent operation ansible executes
	- This is located under the default section and by default it is set to 5
	- Production recommendation is 20
	- Start at 20 and go up or down depending on the performance
- Host Key Checking - `host_key_checking`
	- This is used to validate the host to be managed is valid and authorized
	- By default for the production environment it is set to `True`
	- Ansible will check the host key fin our known_hosts file for the host which we are trying to access
	- If you are working with a Development environment then you can set it to `False`
	- If the host_key_checking is set to False then ansible will not check for the host keys
- Log Path - `log_path`
	- By default ansible execution or operation information will not be logged
	- If you want to log the information about what ansible is doing then you need to set the path 
	- Then ansible will write all the information about its executions
	- Make sure all the users of ansible has write permissions to write

- Below is the sample config file 

```
[defaults]
host_key_checking=False
```

- From the above config we should be able to execute ansible commands without any host checking.
- Let us set an environment variable

```
# export $ANSIBLE_HOST_KEY_CHECKING=True
```

- Now we should not be able to execute the ansible commands without the host key checks
- Because ansible first checks for the environment variables and we set it to True
