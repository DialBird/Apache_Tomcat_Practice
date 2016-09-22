# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-6.7"
  config.vm.network :private_network, ip: "192.10.10.20"

  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", 2048,
      "--cpus", 1
    ]
  end
  config.vm.provision :shell, path: "config/provision/provision.sh"
end
