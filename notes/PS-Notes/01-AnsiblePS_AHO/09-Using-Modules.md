# Using Ansible Modules

- Host/Group Target Patterns
	- ***OR*** - `webservers:dbservers`. This will execute for all the hosts in both the groups
	- ***AND*** - `webservers:&dbservers`. Through AND we can specify the common servers which are in both the groups to set as target. This is used to set the targets based on tags like if we have webservers in testing, development and production and we want to set the target as production webservers then `Webservers:&Production`. This is a complex pattern We can use some more complex patterns like we want to do the same but not on the servers which are running Python3 - `Webservers:&Production:!python3`
	- ***NOT*** - This uses exclamation `!dbservers` to exclude a specific host/group but remaining all can be used as target
	- ***Wildcard*** - We can use wild cards to mention several hosts at a time `web*.linux-library.com`
	- ***Regex*** - We can use the regexes as well in the way like the wildcards `(~web[0-9]+)`
- Let us try to see how to use the modules to install / start some application
	- Browse Module documentation
	- Install Web Server on `web` machine using `yum` module
	- Start web server using `service` module
	- Install DB Server on `db` machine using `yum` module
	- Start DB Server using the `service` module
	- Stop firewalls using the `service` module

```
# ansible-doc yum
# ansible webservers -i inventory -m yum -a "name=httpd state=present" --sudo
# ansible-doc service
# ansible webservers -i inventory -m service -a "name=httpd enabled=yes state=started" --sudo
# ansible dbservers -i inventory -m yum -a "name=mysql-server state=present" --sudo
# ansible dbservers -i inventory -m service -a "name=mysql-server enabled=yes state=started" --sudo
# ansible webservers:dbservers -i inventory -m service -a "name=iptables state=stopped" --sudo
```

# Using Setup Modules

- Through the `setup` module we can gather facts of the machine we want to execute plays on.
- The facts contains all the system information which is needed at the installation process
- For example we want to know what all the ehternet interfaces available on a machine and the configurations of those interfaces

```
# ansible web1 -i inventory -m setup -a "filter=ansible_eth*"
```

- To know the information of the mounts on that machine

```
# ansible web1 -i inventory -m setup -a "filter=ansible_mounts"
```

- To gather all the faces of the machines and store those as facts in a directory `setup` as files with the host names

```
# ansible web1 -i inventory -m setup --tree ./setup
```
