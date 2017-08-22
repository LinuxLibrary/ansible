# Overriding Hosts

- By default ansible looks for the hosts, configs and roles in the `/etc/ansible` directory
- We can override these configs either through editing the `/etc/ansible/ansible.cfg` or through setting up environment variables for ansible
- Let us see how to override the host file
- `ansible.cfg`

	```
	# vi /etc/ansible/ansible.cfg

	inventory = /etc/ansible/hosts
	```

	- Locate the above line, comment it and add your own file for your inventory
- Through Environment Variables

	```
	# export ANSIBLE_INVENTORY="/ansible/hosts"
	```

	- Or else add the environment variables in `/etc/profile`

	```
	# echo -e "\nANSIBLE_INVENTORY=\"/home/ansible/hosts\"" >> /etc/profile
	```

- Another way of overriding the host file is calling the host file by specifying the location of the file with `-i` option in the adhoc commands or else through mentioning the hosts location in the playbook


# Overriding the Configs

- Our default ansible config file is `/etc/ansible/ansible.cfg` where we have all our ansible configs. But we can override the default configs through some ways.
- We can copy the ansible default config file from `/etc/ansible` to a location we need.
- All we need to do is to export the path of the config file to say ansible where our ansible config is located

```
# cp /etc/ansible/ansible.cfg /home/ansible/ansible.cfg
# chown ansible:ansible /home/ansible/ansible.cfg
# export ANSIBLE_CONFIG=/home/ansible/ansible.cfg
```

- This will override the location of the ansible config file for the `ansible` user


# Overriding the roles

- By default we should have all our roles in `/etc/ansible/roles` directory. Or else we should have the specific role located beside the playbook we are using.
- To overcome this we can change the default location of the roles directory
- Either we can comment the existing `roles_path` and add our own
- Or else the second way is we can append multiple role paths. 
- All we need to do is to add all the location of the roles we use in the `roles_path` directive by separating with `:`
- If we have the same role in all the locations we speficy then there is no issue. As ansible stops if it found a match at the first location.
