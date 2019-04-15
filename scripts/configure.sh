#!/usr/bin/env bash

# enable and start service
cp /vagrant/conf/consul.service /etc/systemd/system/consul.service
systemctl enable consul.service
systemctl start consul.service
