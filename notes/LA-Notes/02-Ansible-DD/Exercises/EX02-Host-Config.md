# Ansible Host Configurations

1. Verify that Ansible is running by displaying the version and module path. Change to the Ansible configuration directory and list the contents.
2. Move the original Ansible Hosts file to another file in the same directory called 'hosts.original'. Create a new empty 'hosts' file in the default configuration directory location.
3. Create a section in the new 'hosts' file called 'local'. Make sure it contains:
  * Localhost
  * Localhost.Localdomain
  * 127.0.0.1
4. Create a second section called 'web hosts' with the NAME of the second server in your environment (see previous lab for setting up the two host environment). Display the contents of the file.
