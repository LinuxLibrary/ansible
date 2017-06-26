# Configure Test Environment

1. Use the appropriate command to generate a public and private key pair on 'Server1'. Verify the key pair was created by changing to the appropriate directory and listing the files.
2. Exchange the public key with 'Server2' and the 'user' account on that server. Verify that the identity appearing in the appropriate key file matches the user and system name/IP of the originating 'Server1'.
3. Verify that you are able to log into 'Server2' from 'Server1' with the 'user' account without entering a password. Check the hostname file to be sure you are logged into 'Server2'.
4. Repeat Step #1 for 'Server2' (creating and exchanging the 'user' SSH keys with 'Server1'). Create a file on 'Server1' using any method you choose. Use 'secure copy' to copy that file to 'Server2'. Confirm the copy succeeds without password entry.
5. Using 'secure copy', copy the file from Step #4 back to 'Server1' from 'Server2', renaming it to something else during the copy process, verify that no password was required.
