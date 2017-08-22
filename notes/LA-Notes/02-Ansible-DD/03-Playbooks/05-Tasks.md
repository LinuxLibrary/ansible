# Ansible Tasks

- We have ansible modules available which can be used to do some tasks
- We can get the list of the tasks using `ansible-doc -l` command
- If we want to get the documentation of any specific module we can try `ansible-doc <MODULE>`
- While declaring the task please declare in the order of the process
- Tasks will always executed in the order we declare
- Be sure to name the tasks so that we can know what is going on on the execution also it will give readability for the user
- Below are some examples of declaring those
	- 1

	```
	tasks:
	  - name : <NAME OF THE TASK>
	    action: <MODULE> <OPTIONS>
	```

	- 2

	```
	tasks:
	  - name: <NAME OF THE TASK>
	    <MODULE>: <OPTIONS>
	```

- Below are some working examples
	- 1 

	```
	tasks:
	  - name: Install Elinks
	    action: yum name=elinks state=latest
	```

	- 2

	```
	tasks:
	  - name: Install Elinks
	    yum: name=elinks state=latest
	```
