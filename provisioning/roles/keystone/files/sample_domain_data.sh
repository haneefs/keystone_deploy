#!/usr/bin/env bash

#Create couple of roles
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role create domain_admin
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role create project_admin
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role create project_user
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role create domain_user
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role create cloud_admin
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role create admin
 
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN domain create domain_A
 
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN user create user_AU1 --domain domain_A --password password
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN user create user_AU2 --domain domain_A --password password
 
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN project create project_AP1 --domain domain_A
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN project create project_AP2 --domain domain_A
 
# Use user_id for --user as this openstack client is buggy. If you have two users with same name in two different domain then the following
# command won't work. user_id will work. Same comment is also applicable for projects.
 
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role add --user user_AU1 --domain domain_A domain_admin
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role add --user user_AU2 --domain domain_A domain_user
 
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role add --user user_AU1 --project project_AP1 project_admin
openstack --os-url http://localhost:35357/v3 --os-identity-api-version 3 --os-token=ADMIN role add --user user_AU2 --project project_AP2 project_user

