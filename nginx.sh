#!/bin/bash
rm -rf /etc/yum.repos.d/*
echo -e "[rhel] \nname=xxx \nbaseurl=ftp://201.1.2.254/rhel7 \ngpgcheck=0 \nenable=1" > /etc/yum.repos.d/rhel7.repo
yum repolist 
yum -y install gcc pcre-devel openssl-devel mariadb mariadb-server mariadb-devel php php-mysql
tar -xf /root/lnmp_soft/nginx-1.12.2.tar.gz
cd /root/nginx-1.12.2/
./configure --user=nginx --group=nginx --with-http_ssl_module --with-stream --with-http_stub_status_module
make && make install
ln -s /usr/local/nginx/sbin/nginx /sbin/
useradd nginx
cd /root/lnmp_soft/
yum -y install php-fpm-5.4.16-42.el7.x86_64.rpm
systemctl restart php-fpm.service
systemctl enable php-fpm.service 
systemctl stop httpd
systemctl restart mariadb.service
systemctl enable mariadb.service 

