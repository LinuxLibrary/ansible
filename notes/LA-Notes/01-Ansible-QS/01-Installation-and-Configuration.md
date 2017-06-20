# Ansible Installation and Configuration

- CentOS Machine
	- Install the EPEL (Extra Packages for Enterprise Linux) repository

	```
	# yum install epel-release
	# yum update -y
	```

	- Install `ansible` and some required packages as well.

	```
	# yum install git python python-devel python-pip openssl ansible -y
	```

	- Verify `ansible` has been installed

	```
	# ansible --version
	```

	- Edit the Ansible config file `/etc/ansible/ansible.cfg` and un-comment the following lines

	```
	[defaults]
	inventory = /etc/ansible/hosts
	sudo_root = root
	```

	- Rename the ansible hosts file and create a custom file

	```
	# cd /etc/ansible
	# mv hosts hosts.`date +"%Y%m%d"`
	# vi hosts
	```

	```
	[local]
	localhost ansible_ssh_host=127.0.0.1

	[web]
	web1 ansible_ssh_host=192.168.1.151

	[db]
	db1 ansible_ssh_host=192.168.1.152
	```

	- Create a user, change the passwd and assign some sudo privs for ansible operations
	

	```
	# useradd ansible
	# echo "@nsiP@$$" | passwd --stdin ansible
	# vi /etc/sudoers
	```

	```
	ansible ALL=(ALL)	NOPASSWD: ALL
	```

	- Do the same on the remaining servers as well
	- Generate and copy the SSH keys from the control server to the remaining 2 servers and test the SSH connectivity without using any passwd
