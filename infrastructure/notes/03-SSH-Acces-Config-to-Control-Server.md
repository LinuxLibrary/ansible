# Ansible Control Server SSH Config for ***ansible*** user

- Add "ansible" user
```
	# useradd -m ansible
	# passwd ansible
```

- Add SUDO privillages with NOPASSWD
```
	# vi /etc/sudoers
	
	# User privilege specification
	root    ALL=(ALL:ALL) ALL
	ansible ALL=(ALL)       NOPASSWD:ALL
```

- SSH Key Exchange
Complete SSH Key Exchange in the following process to access the control server from the remote host.
```
	_:REMOTE-HOST:_
	
	-> Create a Public and Private key with empty phrase
	# ssh-keygen -t rsa
	
	-> Copy the Public key to authorized_keys file
	# mv authorized_keys authorized_keys.YYYYMMDD01
	# cp -prv id_rsa.pub >> authorized_keys
	
	_:CONTROL-SERVER:_
	
	-> Switch to ansible user
	# su - ansible
	
	-> Generate SSH Keys
	# ssh-keygen -t rsa
	
	-> Change permissions for .ssh directory and key files
	# chmod 700 .ssh
	# cd .ssh
	# chmod 600 id_rsa.pub
	# chmod 600 authorized_keys
	
	-> Copy the content of Public key from REMOTE-HOST and paste it into CONTROL-SERVER authorized_keys file
```
