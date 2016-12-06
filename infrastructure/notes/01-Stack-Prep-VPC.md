# Ansible Practice Stack Configuration - VPC

For the ansible stack we need 2 hosts
- ***Control Server***
- ***Dev Stack***

I am creating all my stack in AWS. At first i'll create a VPC to configure the network i need for this stack.
After that i'll create the EC2 machine stack. Let us create the VPC first.

- Create a VPC with 10.0.0.0/16 network and tag it
```
	Name Tag 	: cm-an-vpc01
	CIDR Block	: 10.0.0.0/16
	Tenancy		: Default
```

- Create 2 subnets, one for the control server and the another for the dev stack. 
	- Subnet for Control Server
	```
		Name Tag			:	cm-an-subnet01
		VPC					:	cm-an-vpc01
		Availability Zone	:	As of your choice
		CIDR Block			:	10.0.0.0/20
	```

	- Subnet for Dev Stack
	```
		Name Tag			:	cm-an-subnet02
		VPC					:	cm-an-vpc01
		Availability Zone	:	As of your choice
		CIDR Block			:	10.0.16.0/20
	```

- Create an Internet Gateway and tag it.
	```
	Name Tag	: cm-an-ig01
	```
	Attach this IG to your VPC
	```
	-> Attach VPC
	-> Select your Desired VPC
	```

- Create a Route Table and provide your VPC details for routing
	```
	Name Tag	: cm-an-rt01
	VPC			: cm-an-vpc01
	```
	Add your routes and subnet associates
	- Routes
	```
		10.0.0.0/16
		0.0.0.0/0	(Select the internet gateway as the target)
	```
	- Subnet Associates
	```
		-> Click Edit
		-> Check the boxes for all your subnets for associating with your subnets
	```

- Network ACLs
```
		Name Tag	: cm-an-nacl01
		VPC			: cm-an-vpc01
```