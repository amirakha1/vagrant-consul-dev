# This Vagrantfile downloads, installs, and starts latest Consul version in Dev mode.

# Set the modeline to ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT

# Install dependencies
echo "Installing dependencies... "
sudo apt-get update
sudo apt-get install -y unzip curl jq dnsutils

# Download and unzip the latest version
cd /tmp
curl -s https://releases.hashicorp.com/consul/1.4.3/consul_1.4.3_linux_amd64.zip -o consul.zip
echo "Fetching Consul version 1.4.3"
unzip consul.zip

# Set permission and move to the path
chmod +x consul
sudo mv consul /usr/bin/consul

# Create consul config directory and set permission
sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d

SCRIPT

# Specify a Consul version
CONSUL_VERSION = ENV['1.4.3']

# Specify a custom Vagrant box for the demo
DEMO_BOX_NAME = ENV['Consul'] || "debian/stretch64"

# Vagrantfile API/syntax version.
# NB: Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = DEMO_BOX_NAME
  config.vm.provision "shell",
                          inline: $script,
                          env: {'CONSUL_VERSION' => CONSUL_VERSION}

  config.vm.define "n1" do |n1|
      n1.vm.hostname = "n1"
      n1.vm.network "private_network", ip: "172.20.20.10"
      n1.vm.network "forwarded_port", guest: 8500, host: 8500
  end

end