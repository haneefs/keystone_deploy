# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
 
  puts "Configuring proxy ..."
  if Vagrant.has_plugin?("vagrant-proxyconf")
    puts "ProxyConf plugin is available. Try to automate this stuff"
    if ENV["http_proxy"]
      puts "http_proxy: " + ENV["http_proxy"]
      config.proxy.http     = ENV["http_proxy"]
    end
    if ENV["https_proxy"]
      puts "https_proxy: " + ENV["https_proxy"]
      config.proxy.https    = ENV["https_proxy"]
    end
    if ENV["no_proxy"]
      config.proxy.no_proxy = ENV["no_proxy"]
    end
  end
  
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname ="keystone-standalone-vagrant"
  config.vm.network :private_network, ip: "192.168.111.222"
  
       
  config.vm.provider "virtualbox" do |v|
  	# v.gui = true
  end
  config.vm.provision :ansible do |ansible|
		ansible.playbook = "provisioning/keystone_standalone.yml"
		ansible.sudo = true
		ansible.verbose = "vvv"
  end
end
