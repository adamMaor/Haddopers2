# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.define "nodeA" do |nodeA|
        nodeA.vm.box = "ubuntu/trusty64"
		# give name to node
		nodeA.vm.hostname = "slave"
		nodeA.vm.network "private_network", ip: "56.22.1.21"
        nodeA.vm.network "forwarded_port", guest: 8088, host: 8088
		
		#set machine memory
		nodeA.vm.provider :virtualbox do |nodeA|
		nodeA.customize [
		"modifyvm", :id,
		"--memory", "2048",
		]
		end
		
		
        nodeA.vm.provision "shell", inline: <<-SHELL

            # !!! YOU NEED TO REPLACE HERE CORRECT IP ADDRESS !!!
			# this is the slave IP : 56.22.1.21
			# remove line created by setting host name (127.0.1.1 slave slave)
			sudo sed -i '$d' /etc/hosts
			# add slave and master to known hosts
			sudo echo "56.22.1.20 master" >> /etc/hosts
            sudo echo "56.22.1.21 slave" >> /etc/hosts

            # Update VM to the latest binaries from distribution
            # package.
			sudo apt-get update && sudo apt-get upgrade -y
            sudo apt-get install -y vim telnet wget curl htop nmon

            # Installing and configuring java.
            cp /vagrant/install_java.sh .
            ./install_java.sh

            # Passwordless ssh communication between two virtual nodes.
            su vagrant -c "ssh-keygen -t rsa -P '' -f /home/vagrant/.ssh/id_rsa"
            mkdir -p /vagrant/files/ssh/
            cp /home/vagrant/.ssh/id_rsa.pub /vagrant/files/ssh/master.pub
            cp /vagrant/after_startup.sh /home/vagrant/.


			wget -O /vagrant/hadoop-2.7.2.tar.gz http://apache.spd.co.il/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz
			sudo tar zxf /vagrant/hadoop-2.7.2.tar.gz -C /home/vagrant/

			#env vars, chowns, new dirs and cumtomised xmls
			cp /vagrant/conf_files/hadoop_conf_script.sh .
			./hadoop_conf_script.sh

        SHELL
    end

    config.vm.define "nodeB" do |nodeB|
        nodeB.vm.box = "ubuntu/trusty64"
		# give name to node
		nodeB.vm.hostname = "master"
		nodeB.vm.network "private_network", ip: "56.22.1.20"
        nodeB.vm.network "forwarded_port", guest: 8088, host: 9088
		
		nodeB.vm.provider :virtualbox do |nodeB|
		nodeB.customize [
		"modifyvm", :id,
		"--memory", "2048",
		]
		end
		
        nodeB.vm.provision "shell", inline: <<-SHELL
            # !!! YOU NEED TO REPLACE HERE CORRECT IP ADDRESS !!!
			# this is the master IP : 56.22.1.20
			# remove line created by setting host name (127.0.1.1 master master)
			sudo sed -i '$d' /etc/hosts
			# add slave and master to known hosts
            sudo echo "56.22.1.20 master" >> /etc/hosts
			sudo echo "56.22.1.21 slave" >> /etc/hosts

            # Update VM to the latest binaries from distribution
            # package.
            sudo apt-get update && sudo apt-get upgrade -y
            sudo apt-get install -y vim telnet wget curl htop nmon

            # Installing and configuring java.
            cp /vagrant/install_java.sh .
            ./install_java.sh

            # Passwordless ssh communication between two virtual nodes.
            su vagrant -c "ssh-keygen -t rsa -P '' -f /home/vagrant/.ssh/id_rsa"
            mkdir -p /vagrant/files/ssh/
            cp /home/vagrant/.ssh/id_rsa.pub /vagrant/files/ssh/slave.pub
            cp /vagrant/after_startup.sh /home/vagrant/.



			sudo tar zxf /vagrant/hadoop-2.7.2.tar.gz -C /home/vagrant/
			#now setup ENVIROMENT
			cp /vagrant/conf_files/hadoop_conf_script.sh .
			./hadoop_conf_script.sh
			
			#copy init script for later
			cp /vagrant/conf_files/hadoop_init_conf.sh .

			#copy Master configuration files
			sudo cp -r /vagrant/conf_files/for_master/. /home/vagrant/hadoop-2.7.2/etc/hadoop/



        SHELL
    end
end
