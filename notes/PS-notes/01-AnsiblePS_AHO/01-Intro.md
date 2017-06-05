# About Ansible

- Ansible is an open-source automation engine that automates software provisioning, configuration management, and application deployment.
- As with most configuration management software, Ansible has two types of servers: controlling machines and nodes.
- First, there is a single controlling machine which is where orchestration begins. Nodes are managed by a controlling machine over SSH. The controlling machine describes the location of nodes through its inventory.
- To orchestrate nodes, Ansible deploys modules to nodes over SSH. Modules are temporarily stored in the nodes and communicate with the controlling machine through a JSON protocol over the standard output.
- When Ansible is not managing nodes, it does not consume resources because no daemons or programs are executing for Ansible in the background.
- In contrast with popular configuration management software — such as Chef, Puppet, and CFEngine — Ansible uses an agentless architecture.
- With an agent-based architecture, nodes must have a locally installed daemon that communicates with a controlling machine.
- With an agentless architecture, nodes are not required to install and run background daemons to connect with a controlling machine.
- This type of architecture reduces the overhead on the network by preventing the nodes from polling the controlling machine.

- Below are some of the functions of Ansible
---

- ***Change Management***
	- Define a System State
	- Enforce the System State

- ***Provisioning***
	- Prepare a system to make it ready
	- Transition from one state to a different state
	- Examples
		- Making an FTP Server
		- Making an E-Mail Server
		- Making a DB Server
		- Destroy the test Servers
	- Let us see the demo of creating a Web Server
		- Install Web Software
		- Copy Configurations
		- Copy Web Files
		- Install Security Updates
		- Start Web Service

- ***Automation***
	- Define tasks to be executed automatically like:
		- Ordered Takss
		- Make Decisions
		- Ad-hoc tasks
	- Set-it and forget it

- ***Orchestration***
	- Automation and Orchestration are not the same but these are realted
	- Automation is used on a single system
	- Orchestration takes Automation and co-ordinates the process on multiple systems
