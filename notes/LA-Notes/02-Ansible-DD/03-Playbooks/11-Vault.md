# Ansible Vault

- The vault feature can encrypt any structured data file used by Ansible
- Ansible tasks, handlers, and so on are also data so these can be encrypted with vault as well
- To hide the names of variables that you’re using, you can encrypt the task files in their entirety
- The vault feature can also encrypt arbitrary files, even binary files
- If a vault-encrypted file is given as the src argument to the copy module, the file will be placed at the destination on the target host decrypted (assuming a valid vault password is supplied when running the play)
- ***Creating Encrypted Files***
	- To create a new encrypted data file, run the following command:
	
	```
	ansible-vault create foo.yml
	```

	- First you will be prompted for a password. The password used with vault currently must be the same for all files you wish to use together at the same time.
	- After providing a password, the tool will launch whatever editor you have defined with $EDITOR, and defaults to vi. Once you are done with the editor session, the file will be saved as encrypted data.
	- The default cipher is AES
- ***Editing Encrypted Files***
	- To edit an encrypted file in place, use the `ansible-vault edit` command.
	- This command will decrypt the file to a temporary file and allow you to edit the file, saving it back when done and removing the temporary file:

	```
	ansible-vault edit foo.yml
	```

- ***Rekeying Encrypted Files***
	- Should you wish to change your password on a vault-encrypted file or files, you can do so with the rekey command:

	```
	ansible-vault rekey foo.yml bar.yml baz.yml
	```

	- This command can rekey multiple data files at once and will ask for the original password and also the new password.
- ***Encrypting Unencrypted Files***
	- If you have existing files that you wish to encrypt, use the `ansible-vault encrypt` command. This command can operate on multiple files at once:

	```
	ansible-vault encrypt foo.yml bar.yml baz.yml
	```

- ***Decrypting Encrypted Files***
	- If you have existing files that you no longer want to keep encrypted, you can permanently decrypt them by running the `ansible-vault decrypt` command. 
	- This command will save them unencrypted to the disk, so be sure you do not want `ansible-vault edit` instead:

	```
	ansible-vault decrypt foo.yml bar.yml baz.yml
	```
