# keystone_deploy
Keystone deploy using ansible

Prequisite:

    Install Virutal box:
       https://www.virtualbox.org/wiki/Downloads
    
	Install Ansible:
	    http://docs.ansible.com/intro_installation.html#latest-releases-via-apt-ubuntu
	    sudo easy-install pip
	    sudo pip install ansible  
	    
	Install vagrant:
	    http://www.vagrantup.com/downloads
	    
	    wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
	    sudo dpkg -i https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
	    
	Install vagrant proxy plugin 
	    
	    vagrant plugin install vagrant-proxyconf
	    
	    
Setup:

     Clone the repo:
       
       git clone	https://github.com/haneefs/keystone_deploy.git
       cd keystone-deploy
       vagrant up
       
       if ansible fails inbetween just run
       
       vagrant provision
 
 
 To login to keystone node
        
       #Make sure you are in keystone-deploy directory
        vagrant ssh
        
 To verify keystone is running
         
         from within the keystone node
         
         curl -k -H "X-Auth-Token:ADMIN" http://localhost:35357/v3/domains | python -mjson.tool  
            
  
  Advanced usage: <You may not need this>
  
     In order to running custom or specific task associate tags with the task and run with tags
  	  
  	   ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=.vagrant/machines/default/virtualbox/private_key -u vagrant  --tags <tagName>  <playbook>
  	   
  	   e.g ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=.vagrant/machines/default/virtualbox/private_key -u vagrant  --tags data provisioning/keystone_standalone.yml
    
    Just syntax check for the playbook
       ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=.vagrant/machines/default/virtualbox/private_key -u vagrant  --check provisioning/keystone_standalone.yml
