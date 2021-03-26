
# create vm on vsphere
1. pip install pyvmomi
2. ansible-playbook create-vm.yml


# bigdata-platform-deploy

1. Download the following software packages: (http://47.102.63.222/ambari/ - alicloud) and untar each HDP&ambari .gz package in current path
ambari-2.7.4.0-centos7.tar.gz
HDP-3.1.4.0-centos7-rpm.tar.gz
HDP-GPL-3.1.4.0-centos7-gpl.tar.gz
HDP-UTILS-1.1.0.22-centos7.tar.gz
jce_policy-8.zip
jdk-8u112-linux-x64.tar.gz

2. download and copy mysql-connector-java to repository on ambari-server hosts
wget https://www.aht-group.com/nexus/content/repositories/public/mysql/mysql-connector-java/8.0.11/mysql-connector-java-8.0.11.jar

3. Execute build-repo.sh
4. Update server_vars.yml
5. Execute playbook
ansible-playbook -i hosts setup.yml


