##-----------------------------------------------------------------
##-----------------   build the local repository ------------------
##-----------------------------------------------------------------
BASE_PATH=`pwd`/package
YUM_REPO_NAME=repo
YUM_REPO=${BASE_PATH}/${YUM_REPO_NAME}
PIP_REPO=${BASE_PATH}/pip

if [ -d ${YUM_REPO} ];
then
    echo "${YUM_REPO} is exist"
else
    mkdir -p ${YUM_REPO}
fi

if [ -d ${PIP_REPO} ];
then
    echo "${PIP_REPO} is exist"
else
    mkdir -p ${PIP_REPO}
fi

yum install -y epel-release.noarch

yum install -y --downloadonly --downloaddir=${YUM_REPO} yum-utils device-mapper-persistent-data lvm2 yum-plugin-downloadonly createrepo xfsprogs nss curl libcurl
yum install -y --downloadonly --downloaddir=${YUM_REPO} postgresql-server
yum install -y --downloadonly --downloaddir=${YUM_REPO} unzip wget ntp pexpect
yum install -y --downloadonly --downloaddir=${YUM_REPO} python-devel python-pip python-setuptools

yum install yum-utils createrepo -y

createrepo ${YUM_REPO}

yum install -y python-devel python-pip python-setuptools
yum install -y httpd
yum install -y ansible
pip download -d ${PIP_REPO} pexpect


### 
#### Generate httpd.conf file #####
### 
cat <<EOT > /etc/httpd/conf/httpd.conf
ServerRoot "/etc/httpd"
Listen 80
Include conf.modules.d/*.conf
User apache
Group apache

<IfModule mime_module> 
    TypesConfig /etc/mime.types
</IfModule>

DocumentRoot "${BASE_PATH}"
<Directory "${BASE_PATH}">
    Options Indexes FollowSymLinks
</Directory>

EOT

systemctl restart httpd
systemctl enable httpd
systemctl stop firewalld
systemctl disable firewalld
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config

IFS='/' read -r -a array <<< "${BASE_PATH}"
echo "chmod 755 /${array[1]}"
chmod 755 /${array[1]}

reboot




