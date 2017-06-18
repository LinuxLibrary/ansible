# User Management with Ansible

- For all my exercises I am using the below inventory file

- `inventory`

```
[control]
acs ansible_ssh_host=192.168.1.150

[web]
web01 ansible_ssh_host=192.168.1.151

[db]
db01 ansible_ssh_host=192.168.1.152
```

- I've exchanged SSH keys to all the hosts from the control server (acs)
- Now let us see the User Management through Ansible
- Through AdHoc Commands
	- Create a user

	```
	# ansible all -i inventory -m user -a "name=ansible" --sudo
	```

	- Create a group

	```
	# ansible all -i inventory -m group -a "name=ansible" --sudo
	```

	- Add `ansible` user to `ansible` group

	```
	# ansible all -i inventory -m user -a "name=ansible append=yes groups=ansible" --sudo
	```

	- Let us create another user with some custom home directory, group, description as well

	```
	# ansible all -i inventory -m shell -a "mkdir /u01/admin" --sudo
	# ansible all -i inventory -m group -a "name=admin" --sudo
	# ansible all -i inventory -m user -a "name=arjun groups=admin move_home=yes home=/u01/admin/arjun comment='Arjun Shrinivas' state=present" --sudo
	```
