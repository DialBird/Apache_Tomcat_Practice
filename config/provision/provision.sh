#!/bin/bash -ex

yum -y update

# timezone
cat "ZONE='Asia/Tokyo'" > /etc/sysconfig/clock
hwclock --systohc

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
cp -r config/tomcat/apache-tomcat-8.0.37 /usr/local
chmod u+x /usr/local/apache-tomcat-8.0.37/bin/startup.sh
chmod u+x /usr/local/apache-tomcat-8.0.37/bin/shutdown.sh
chmod u+x /usr/local/apache-tomcat-8.0.37/bin/catalina.sh
