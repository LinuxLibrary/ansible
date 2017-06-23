# Ansible Test Environment Setup

- For this exercise I am using 3 servers. Let us do the below pre-requisites
- Add user and password on all the 3 machines

```
# useradd ansible
# echo "@ns!P@SS" | passwd --stdin ansible
```

- Create a directory for playbooks in `ansible`'s homedir and change the ownership of that directory. in all the 3 machines

```
# cd /home/ansible
# mkdir playbooks
# chown ansible:ansible playbooks
```

- Generate and exchange the SSH keys between the three hosts using `ssh-keygen` and `ssh-copy-id`
