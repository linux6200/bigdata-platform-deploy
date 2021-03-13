# bigdata-platform-deploy

1. Download the following software packages:
ambari-2.7.4.0-centos7.tar.gz
HDP-3.1.4.0-centos7-rpm.tar.gz
HDP-GPL-3.1.4.0-centos7-gpl.tar.gz
HDP-UTILS-1.1.0.22-centos7.tar.gz
jce_policy-8.zip
jdk-8u112-linux-x64.tar.gz

2. Execute build-repo.sh
3. Update server_vars.yml
4. Execute playbook
ansible-playbook -i hosts setup.yml


   
