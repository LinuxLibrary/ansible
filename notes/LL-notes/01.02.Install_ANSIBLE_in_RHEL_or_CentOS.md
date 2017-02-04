# Configure ANSIBLE in RHEL / CentOS 6.X :
---

> Reference : http://docs.ansible.com/ansible/intro_installation.html

- Step 1 : Clone the ansible repository from GITHUB

	```
	$ git clone git://github.com/ansible/ansible.git --recursive
	$ cd ./ansible
	```

- Step 2 : Setup your environment

	- Using Bash:
	
	```
	$ source ./hacking/env-setup
	```

	- Using Fish:
	
	```
	$ . ./hacking/env-setup.fish
	```

	- If you want to suppress spurious warnings/errors, use:
	
	```
	$ source ./hacking/env-setup -q
	```

- Step 3 : Install PIP and Python modules for ANSIBLE	
	
	- If you don’t have pip installed in your version of Python, install pip:
	
	```
	$ easy_install pip
	```
	- Ansible also uses the following Python modules that need to be installed :
	
	```
	$ pip install paramiko PyYAML Jinja2 httplib2 six
	```
	
	> NOTE: When updating ansible, be sure to not only update the source tree, but also the “submodules” in git which point at Ansible’s own modules (not the same kind of modules, alas).

	
	```
	$ git pull --rebase
	$ git submodule update --init --recursive
	```

	- Once running the env-setup script you’ll be running from checkout and the default inventory file will be /etc/ansible/hosts.
	- You can optionally specify an inventory file (see Inventory) other than /etc/ansible/hosts:
	
	```
	$ echo "127.0.0.1" > ~/ansible_hosts
	$ export ANSIBLE_INVENTORY=~/ansible_hosts
	```
