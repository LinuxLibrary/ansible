# Ansible Host Configurations - Solutions

1. Verify that Ansible is running by displaying the version and module path. Change to the Ansible configuration directory and list the contents.

```
[root@dev01 ~]# ansible --version
ansible 1.9.2
  configured module search path = None
[root@dev01 ~]# cd /etc/ansible
[root@dev01 ansible]# ll
total 20
-rw-r--r--. 1 root root 8629 Jun 25 21:11 ansible.cfg
-rw-r--r--. 1 root root   88 Sep 21 14:43 hosts
drwxr-xr-x. 2 root root    6 Jun 25 21:11 roles
```
 
2. Move the original Ansible Hosts file to another file in the same directory called 'hosts.original'. Create a new empty 'hosts' file in the default configuration directory location.

```
[root@dev01 ansible]# mv hosts hosts.original && touch hosts && ll
total 20
-rw-r--r--. 1 root root 8629 Jun 25 21:11 ansible.cfg
-rw-r--r--. 1 root root   0 Sep 21 14:43 hosts
-rw-r--r--. 1 root root  965 Jun 25 21:11 hosts.original
drwxr-xr-x. 2 root root    6 Jun 25 21:11 roles
```
 
3. Create a section in the new 'hosts' file called 'local'. Make sure it contains:
  * Localhost
  * Localhost.Localdomain
  * 127.0.0.1

```
[root@dev01 ansible]# vim hosts
[root@dev01 ansible]# cat hosts
[local]
127.0.0.1
localhost
localhost.localdomain
```
 
4. Create a second section called 'web hosts' with the NAME of the second server in your environment (see previous lab for setting up the two host environment). Display the contents of the file.

```
[root@dev01 ansible]# vim hosts
[root@dev01 ansible]# cat hosts
[local]
127.0.0.1
localhost
localhost.localdomain
 
[web hosts]
dev02.mylabserver.com
```
