# Ansible Command Line

- List all hosts which have been mentioned in the inventory file

```
# ansible all --list-hosts
```

- List hosts of a specific group

```
# ansible <GROUP_NAME> --list-hosts
```

- Ping all the machines 

```
# ansible all -m ping
```

- List all the python based packages installed on the machines of the `web` group

```
# ansible web -m shell -a 'yum list installed | grep python' --sudo
```

- Install `elinks` in all the machines

```
# ansible all -m shell -a 'yum install elinks -y' --sudo
```
