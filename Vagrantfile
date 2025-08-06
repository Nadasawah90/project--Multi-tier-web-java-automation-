Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true 
  config.hostmanager.manage_host = true
  
### nagios vm  ####
  config.vm.define "nagios" do |nagios|
    nagios.vm.box = "eurolinux-vagrant/centos-stream-9"
    nagios.vm.box_version = "9.0.43"
    nagios.vm.hostname = "nagios"
    nagios.vm.network "private_network", ip: "192.168.56.20"
    nagios.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
	 
    nagios.vm.provision "shell", path: "bootstrap-nagios.sh", privileged: false
	end
 end
 
 end
