# Scaling out Inventory files

- Using directories
	- Can use to break-out long running inventory files
	- Very useful when dealing with large environments

- We now want to create a user on the webserver group. We already have the inventory files. Lets go to the production directory and execute the adhoc command to create user against the webservers group

```
# ansible webservers -i inventory_prod -m user -a "name={{username}} password=12345" --sudo
```

- This command will run the useradd command with sudo privillages, because we are executing this command as the vagrant user.
- Lets create a webservers inventory file in the group_vars directory to create a group user

```
# ansible webservers -i inventory_prod -m user -a "name={{username}} password=12345" --sudo
```
