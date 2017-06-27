# Gathering System Facts in Ansible

- We can use the `setup` module to gather the facts.

```
# ansible web -m setup
```

- The above command will get all the facts of the machines in the web group. If we want to store the gathered facts as a file we can do the same. If we have multiple groups of hosts and number of hosts then we can store those as well using the `--tree <PATH_OF_THE_DIRECTORY_TO_STORE_FACTS>` option.

```
# ansible all -m setup --tree /home/ansible/facts
```

- The above command will create seperate directories for each group in the facts directory and in each of those directories it will store the facts of the individual hosts with the host name
- Also we can get some values which are needed in the playbooks. This can be done through the arbitary called `filter`.
- Let us see some examples of gathering facts
- System Architecture

```
# ansible web -m setup -a 'filter=ansible_architecture'
```

- OS Distribution

```
# ansible web -m setup -a 'filter=ansible_distribution'
```

- OS Distribution Version

```
# ansible web -m setup -a 'filter=ansible_distribution_version'
```

- Check DomainName

```
# ansible web -m setup -a 'filter=ansible_domain'
```

- Get Fully Qualified DomainName of a machine

```
# ansible web -m setup -a 'filter=ansible_fqdn'
```

- Check ethernet interfaces

```
# ansible web -m setup -a 'filter=ansible_interfaces'
```

- Kernel Version

```
# ansible web -m setup -a 'filter=ansible_kernel'
```

- Total memory

```
# ansible web -m setup -a 'filter=ansible_memtotal_mb'
```

- Processors
	- Cores

	```
	# ansible web -m setup -a 'filter=ansible_processor_cores'
	```

	- Count

	```
	# ansible web -m setup -a 'filter=ansible_processor_count'
	```

	- VCPUs

	```
	# ansible web -m setup -a 'filter=ansible_processor_vcpus'
	```

- Virtualization
	- Role

	```
	# ansible web -m setup -a 'filter=ansible_virtualization_role'
	```

	- Type

	```
	# ansible web -m setup -a 'filter=ansible_virtualization_type'
	```
