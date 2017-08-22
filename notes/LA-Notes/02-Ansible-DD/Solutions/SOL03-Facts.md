# Ansible Facts - Solutions

1. Verify that your ansible installation is available by displaying the version of ansible while logged in as the 'user' user.

```
[test@dev01 ~]$ ansible --version
ansible 1.9.2
  configured module search path = None
```
 
2. Run the ansible command that lists all of the hosts configured in your control server 'hosts' file for the system.

```
[test@dev01 ~]$ ansible all --list-hosts
    dev03.mylabserver.com
    localhost
    dev02.mylabserver.com
```
 
3. Using the 'setup' module for ansible, list all of the known facts on the local system.

```
[test@dev01 ~]$ ansible local -m setup 
localhost | success >> {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "172.31.107.208"
        ], 
        "ansible_all_ipv6_addresses": [
            "fe80::103f:68ff:fefe:2bd1"
        ], 
        "ansible_architecture": "x86_64", 
        "ansible_bios_date": "05/06/2015", 
        "ansible_bios_version": "4.2.amazon", 
        "ansible_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-3.10.0-229.14.1.el7.x86_64", 
        (NOTE: Your output will be larger as this was concatenated for space and readability)
```
 
4. Using the 'setup' module for ansible, list all of the known facts for all systems configured in the 'hosts' file on the system.

```
[test@dev01 ~]$ ansible all -m setup 
(NOTE: Localhost truncated here... starting with another host output)
dev02.mylabserver.com | success >> {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "172.31.108.45"
        ], 
        "ansible_all_ipv6_addresses": [
            "fe80::1029:fbff:fed6:9aaf"
        ], 
        "ansible_architecture": "x86_64", 
        "ansible_bios_date": "05/06/2015", 
        "ansible_bios_version": "4.2.amazon", 
        "ansible_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-3.10.0-229.14.1.el7.x86_64", 
   (NOTE: Your output will be larger as this was concatenated for space and readability)
```
 
5. While listing the facts on the local system, filter the list showing only the content pertaining to the system IP addresses.

```
[test@dev01 ~]$ ansible local -m setup -a 'filter=ans*ipv4*'
localhost | success >> {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "172.31.107.208"
        ], 
        "ansible_default_ipv4": {
            "address": "172.31.107.208", 
            "alias": "eth0", 
            "gateway": "172.31.96.1", 
            "interface": "eth0", 
            "macaddress": "12:3f:68:fe:2b:d1", 
            "mtu": 9001, 
            "netmask": "255.255.240.0", 
            "network": "172.31.96.0", 
            "type": "ether"
        }
    }, 
    "changed": false
}
```
