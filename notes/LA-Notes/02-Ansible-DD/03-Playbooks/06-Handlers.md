# Handler Section

- It is a combination of 2 operations
	- When something happens then to notify
	- After receiving notification start a task based on the requirement
- These tasks will execute when all the other tasks in the play completes their execution
- Tasks only notify when state=changed
- Tasks with asynchronous execution
- Tasks in the handlers section only runs tasks when notified
- Most common for restarting services to load changes (if changed are made)
- Let us see an example.

```
  tasks:
    - name: Install Web Server
      yum: name=httpd state=latest
      notify: Restart HTTPD
  handlers:
    - name: Restart HTTPD
      service: name=httpd state=restarted
```
