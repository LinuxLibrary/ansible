# Ansible Commands

- Ping all the machines listed in the ansible host file

	```
	# ansible all -m ping
	```

- List all the contents in `/home/ansible/` directory

	```
	# ansible all -a "ls -ltrh /home/ansible"
	```
	
	- Here we have not mentioned any module as ansible by defaults uses the `command` module and through `-a` we need to mention the arbitary commands or options

- Execute privillaged commands through sudo privillages. For this we need to execute the commands along with `-s` or `--sudo` option

	```
	# ansible all -a -s "cat /var/log/messages | tail -n2"

	or

	# ansible all -a "cat /var/log/messages | tail -n2" --sudo
	```

- Copy a file from the control server to `web1` server

	```
	# echo "This is test" > test.txt
	# ansible web -m copy -a "src=test.txt dest=/tmp/test.txt"
	```

- Install `elinks` on Control Server(Ubuntu Machine) and also on web1(CentOS Machine)

	```
	# ansible acs -m apt -a "name=elinks state=latest" --sudo
	# ansible web1 -m yum -a "name=elinks state=latest" --sudo
	```
