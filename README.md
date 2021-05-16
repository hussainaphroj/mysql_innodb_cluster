# MySQL Innodb Cluser setup using Ansible with Router HA nodes  
* This playbook help us to setup the MYSQL Cluster and Router. It creaete innodb cluster on 3 nodes and configure MySQL Router HA on the reaming 2 servers.  
* This cluster require minimum 5 vms that is 3 for InnoDB and 2 for Router HA and with ineternet connectivity. Onece the vms are ready, Pleae follow the below steps to setup the cluster.  
* Clone the Ansible playbook from our repository.  
```
git clone https://github.com/hussainaphroj/mysql_innodb_cluster.git
```
* Edit host file which is present in mysql_innodb_cluster as shown below:  
 ```
[mysql]  
node1 ansible_host=192.168.56.51 server_id=1 replication_group_name=CONTROL123 primary="true"  
node2 ansible_host=192.168.56.52 server_id=2 replication_group_name=CONTROL234 primary="false"  
node3 ansible_host=192.168.56.53 server_id=3 replication_group_name=CONTROL345 primary="false"  
[router]  
router1 ansible_host=192.168.56.61 router_primary=true  
router2 ansible_host=192.168.56.62 router_primary=false  

```

* The default values are used and we can modifies these vaules in main.yml in default directories respective modules.  
* The following variables are used:  

  * mysql_community: Repo url for mysql community packages  
  * mysql_tools: Repo URL for mysql_tool packages  
  * mysql_connectors: Repo URL for mysql_connector packages  
  * mysql_packages: List of packages to be installed  
  * mysql_data_dir: Location of data directory of mysql  
  * mysql_root_password: Mysql root password to be updated/changed  
  * innodb_cluster_admin_password: Cluster admin password  
  * innodb_cluster_user: Cluster admin user, keep it as icroot only because the same user is used for mysqlrouter bootstrapping.  
  * ha_passwd: password for HA Cluseter  
  * vip_ip: Virtual IP that application used to connect  
  * router_rpm: Router rpm url from where it will be installed  
  * innodb_cluster_admin_password: InnoDB Cluster admin(icroot) password that used to create cluster admin innodb roles  
  * mysql_primary: Hostname of our mysql innodb primary node  

*  Run the playbook as  
```
ansible-playbook -i host mysql_cluster.yml -u <username> --ask-pass -b  
```
Go and grab a cup of coffee while your cluserter is getting setup.
