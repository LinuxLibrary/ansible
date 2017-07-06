# Outline for Playbook

- Instead of going blindly to write a playbook it would be a good practice to get the playbook prepared based on a outline
- Outline is just a simple text file where we have the set of list of tasks we perform through playbook
- Later on we can convert those steps into tasks/plays
- This would be a best way as we might not miss anything
- Let us try to create an outline based on our requirement and below is a sample example
- Outline for a WebServer and its client packages
	- Get a list of servers against which we have our plays to be executed
	- Get the user through which we perform the plays
	- Sudo privillages if needed
	- Facts if needed
	- Date/Time of the Pre-Play
	- Install packages for web server
	- Start the services
	- Verify the services are running
	- Install required client packages
	- Date/Time of Post-Play

```
- Hosts: web
- User: ansible
- Sudo privs: yes
- Gather facts: yes

- Date/Time of Pre-Play

- Install Apache WebServer packages
- Start service
- Verify the service
- Install below client packages
	- elinks
	- telnet

- Date/Time of Post-Play
```
