#!/usr/bin/env bash

# Install dependencies if needed
which unzip curl jq dnsutils 2>&1 || {
  echo "Installing dependencies... "
  apt-get update
  apt-get install -y unzip curl jq dnsutils
}

# Download consul if needed
which consul 2>&1 || {
  pushd /usr/local/bin
  echo "Fetching Consul version 1.4.3"
  curl -sL -o /var/tmp/consul.zip https://releases.hashicorp.com/consul/1.4.3/consul_1.4.3_linux_amd64.zip
  unzip /var/tmp/consul.zip
  rm /var/tmp/consul.zip

  # Set permission and move to the path
  chmod +x consul

  popd
}

# create /etc/consul.d if needed
[ -d /etc/consul.d ] || {
  # Create consul config directory and set permission
  mkdir /etc/consul.d
  chmod a+w /etc/consul.d
}

echo "provisioning done"
