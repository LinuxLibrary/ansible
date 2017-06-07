# Creating environment for Ansible

- Install Vagrant and one of your favourite hypervisor from either VMWare/VirtualBox
- Create a directory and go to that directory where you want to maintain the VagrantFiles
	- Initialize vagrant

	```
	# vagrant init
	```

	- Edit the `VagrantFile` and remove everything between `Vagrant.configure` line and `end` line
	- You should see like below

	```
	Vagrant.configure("2") do |config|
		
	end
	```

	- Now let us add our configs to create some machines required for ansible

	```
        Vagrant.configure("2") do |config|
        	config.vm.define "acs" do |acs|
			acs.vm.box = "ubuntu/trusty64" # Get the name of the box from "www.vagrantcloud.com"
			acs.vm.hostname = "acs"
			acs.vm.network "private_network", ip: "192.168.1.150"
		end
		config.vm.define "web" do |web|
			web.vm.box = "nrel/CentOS-6.5-x86_64"
			web.vm.hostname = "web"
			web.vm.network "private_network", ip: "192.168.1.151"
			web.vm.network "forwarded_port", guest: 80, host: 8080
		end
		config.vm.define "db" do |db|
			db.vm.box = "nrel/CentOS-6.5-x86_64"
			db.vm.hostname = "db"
			db.vm.network "private_network", ip: "192.168.1.152"
		end
        end
	```

	- Now we are ready to execute vagrant to run the above config and prepare our stack

	```
	# vagrant up
	```
