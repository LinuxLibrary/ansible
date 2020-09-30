# Automation through Ansible
This repository contains information, notes and configuration details which
can be useful to learn ANSIBLE. Ansible is a free software platform for co
-nfiguring and managing computers. It combines multi-node software deployme
-nt, ad hoc task execution, and configuration management. It manages nodes 
over SSH or PowerShell and requires Python (2.4 or later) to be installed on 
them. Modules work over JSON and standard output and can be written in any 
programming language. The system uses YAML to express reusable descriptions 
of systems.

The platform was created by Michael DeHaan, the author of the provisioning 
server application Cobbler and co-author of the Func framework for remote a
-dministration. It is included as part of the Fedora distribution of Linux, 
owned by Red Hat inc., and is also available for Red Hat Enterprise Linux, 
CentOS, and Scientific Linux via Extra Packages for Enterprise Linux (EPEL) 
as well as other operating systems. Ansible is commercially supported and s
-ponsored by Ansible, Inc.

# Configure ANSIBLE in RHEL / CentOS 6.X :

* Reference : http://docs.ansible.com/ansible/intro_installation.html

- Step 1 : Clone the ansible repository from GITHUB

	* $ git clone git://github.com/ansible/ansible.git --recursive
	* $ cd ./ansible
	
- Step 2 : Setup your environment

	* Using Bash:
	  $ source ./hacking/env-setup
	
	* Using Fish:
	  $ . ./hacking/env-setup.fish
	
	* If you want to suppress spurious warnings/errors, use:
	  $ source ./hacking/env-setup -q
	
- Step 3 : Install PIP and Python modules for ANSIBLE	
	
	* If you don’t have pip installed in your version of Python, install pip:
	  $ easy_install pip
	
	* Ansible also uses the following Python modules that need to be installed :
	  $ pip install paramiko PyYAML Jinja2 httplib2 six
	
	* Note when updating ansible, be sure to not only update the source tree, but 
	  also the “submodules” in git which point at Ansible’s own modules (not the 
	  same kind of modules, alas).

	  $ git pull --rebase
	  $ git submodule update --init --recursive
	
	* Once running the env-setup script you’ll be running from checkout and the de
	  -fault inventory file will be /etc/ansible/hosts. You can optionally specify 
	  an inventory file (see Inventory) other than /etc/ansible/hosts:
	
	  $ echo "127.0.0.1" > ~/ansible_hosts
	  $ export ANSIBLE_INVENTORY=~/ansible_hosts
