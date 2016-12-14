# Ansible Practice Stack Configuration - EC2

We have configured VPC, Subnets, Internet Gateway, Routes and NACLs. So our network is ready. Now let us configure our EC2 stack.
For this we need to configure separate security groups for both Control Server and Dev Stack.

- ***Control Server Security Group***
	```
	SG Name		:	cm-anctrl-sg01
	VPC			:	cm-an-vpc01
	```
	Configure the Inbound and Outbound Rules
	- Inbound
	```
	All ICMP	:	Anywhere
	SSH			:	Anywhere
	```
	- Outbound
	```
	All Traffic	:	Anywhere
	```
	
- ***Dev Stack Security Group***
	```
	SG Name		:	cm-andev-sg02
	VPC			:	cm-an-vpc01
	```
	Configure the Inbound and Outbound Rules
	- Inbound
	```
	All ICMP	:	Anywhere
	SSH			:	10.0.0.0/16
	```
	- Outbound
	```
	All Traffic	:	Anywhere
	```
	
Let us launch the instances now

- ***Launch Control Server Instance***
```
	-> Select an AMI
	-> Select Instance Type
	-> Select your VPC
		Auto-assign Public IP : Enable
	-> Tag : cm-anctrl01
	-> Security Group : cm-anctrl-sg01
```

- ***Launch Dev Stack Instance***
```
	-> Select an AMI
	-> Select Instance Type
	-> Select your VPC
		Auto-assign Public IP : Use subnet setting (Disabled)
	-> Tag : cm-andev01
	-> Security Group : cm-an-sg02
```
