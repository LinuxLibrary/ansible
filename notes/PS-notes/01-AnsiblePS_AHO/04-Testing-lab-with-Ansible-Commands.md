# Testing lab with Ansible commands

- Let us create an inventory file on our control server and add the remaining 2 hosts to that inventory

```
# vagrant ssh acs
# vi inventory

192.168.1.151
192.168.1.152
```

- Exchange the SSH keys or else try to ssh to those hosts and have the remote system keys get copied to your known hosts file
- Ping the hosts from the control host

```
# ansible 192.168.1.151 -i inventory -u vagrant -m ping -k
# ansible 192.168.1.152 -i inventory -u vagrant -m ping -k
# ansible all -i inventory -u vagrant -m ping -k
# ansible * -i inventory -u vagrant -m ping -k
```

- To get the debugging info of the command run the command with:
	- `-v` for level 1 debugging
	- `-vv` for level 2 debugging
	- `-vvv` for level 3 debugging

- Lets run some adhoc commands on the stack
	- Both the hosts in my inventory are using centos so I want to run `yum update` and `yum upgrade`

	```
	# ansible all -i inventory -u vagrant -m command -a "/usr/sbin/yum update -y && /usr/sbin/yum upgrade -y" -k
	# ansible all -i inventory -u vagrant -a "/usr/sbin/yum update -y && /usr/sbin/yum upgrade -y" -k
	```

	- In the above example we can run the adhoc command without using the `command` module as well because the commands module is default
	- We have `command` and `shell` modules. `command` module will run through python where as `shell` module run through the shell of the machine. This will benefit if we are using any of our SHELL variables like $PATH

- Below is the detailed explanation of the use of the options we've used in the adhoc commands
	
	```
	# ansible <HOST(s)> 
		-i <INVENTORY_FILE>
		-u <USER>
		-m <MODULE>
		-k <prompt for ssh password>
	```
