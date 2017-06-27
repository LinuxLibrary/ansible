# Ansible Playbook - 01

- Let us install the elinks package on the webserver
- Below is the playbook to do this task

```
--- # Playbook - 01 - Install elinks on webserver
- hosts: web
  tasks:
  - name: Install elinks
    yum: pkg=elinks state=latest
...
```

- In the above playbook the first line we have 3 hypens and in the bottom of the playbook we have 3 dots. This will indicated the begin and end of the playbook also this is optional.
- `hosts` tag will tell ansible that against which hosts/host-group the plays should run
- `tasks` will have single or collection of tasks which need to be run
- `name` will give us the facility to name the task we need to perform. So that we can differentiate while we have multiple plays/tasks.
- `yum` module used for the task
- Now if we are ready with the playbook then we can run it

```
# ansible-playbook 01-webserver.yaml --sudo
```

- Here we are giving the sudo to run this play by using the sudo privillages
