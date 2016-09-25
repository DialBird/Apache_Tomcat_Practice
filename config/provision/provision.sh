#!/bin/bash -ex 

yum -y update 

# iptables
service iptables stop
chkconfig iptables off

# java
yum -y install java-1.8.0-openjdk
yum -y install java-1.8.0-openjdk-devel

# postgresql
yum -y install postgresql
yum -y install postgresql-server
yum -y install postgresql-contrib
service postgresql initdb
service postgresql start
chkconfig postgresql on

# tomcat
cp -r /vagrant/config/tomcat/apache-tomcat-8.0.37 /opt
cp /vagrant/config/tomcat/postgresql-8.0-312.jdbc2.jar /opt/apache-tomcat-8.0.37/lib
chmod u+x /opt/apache-tomcat-8.0.37/bin/startup.sh
chmod u+x /opt/apache-tomcat-8.0.37/bin/shutdown.sh
chmod u+x /opt/apache-tomcat-8.0.37/bin/catalina.sh

# apache
yum -y install pcre pcre-devel wget gcc make bison flex perl
cp -r /vagrant/config/apache/apr-1.5.2 /usr/local/src
cp -r /vagrant/config/apache/apr-util-1.5.4 /usr/local/src
cp -r /vagrant/config/apache/httpd-2.4.23 /usr/local/src
cd /usr/local/src/apr-1.5.2 && ./configure --prefix=/opt/apr/apr-1.5.2 && make && make install
cd /usr/local/src/apr-util-1.5.4 && ./configure --prefix=/opt/apr-util/apr-util-1.5.4 --with-apr=/opt/apr/apr-1.5.2 && make && make install
cd /usr/local/src/httpd-2.4.23 && ./configure --prefix=/opt/httpd/httpd-2.4.23 --with-apr=/opt/apr/apr-1.5.2 --with-apr-util=/opt/apr-util/apr-util-1.5.4 && make && make install
cp /vagrant/config/apache/httpd-proxy.conf /opt/httpd/httpd-2.4.23/conf/extra
