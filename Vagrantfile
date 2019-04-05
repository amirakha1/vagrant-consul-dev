# This Vagrantfile downloads, installs, and starts latest Consul version in Dev mode.

# Set the modeline to ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/stretch64"
  config.vm.provision "shell", inline: "scripts/provision.sh"

  config.vm.define "n1" do |n1|
      n1.vm.hostname = "n1"
      n1.vm.network "private_network", ip: "172.20.20.10"
      n1.vm.network "forwarded_port", guest: 8500, host: 8500
  end

end
