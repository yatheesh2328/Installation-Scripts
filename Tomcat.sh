#!/bin/bash
apt install -y default-jre
apt install -y wget --nogpgcheck
mkdir -p /opt
cd /opt
//download tar file
wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz --no-check-certificate
tar -xvvf apache-tomcat-8.5.72.tar.gz

cd /opt/apache-tomcat-8.5.72/bin
./startup.sh

# go to the chrome and enter public_ip_address:8080

#we can change the port number from 8080 to any other port but before change make sure that port is open in acl

cd /opt/apache-tomcat-8.5.72/conf
#edit the port number in server.xml file which is in conf folder
sed -i 's/connector port="8080"/connector port="8081"/g' server.xml

#add the user to login 
#add the below lines in file tomcat-users.xml which is conf folder under tomcat-user tag

#paste below lines under <tomcat-users> </tomcat-users> tags
 
<!-- user manager can access only manager section -->
<role rolename="manager-gui" />
<user username="manager" password="_SECRET_PASSWORD_" roles="manager-gui" />

<!-- user admin can access manager and admin section both -->
<role rolename="admin-gui" />
<user username="admin" password="_SECRET_PASSWORD_" roles="manager-gui,admin-gui" />

### Comment the below lines to allow connections from anywhere in the below lines.
1. /opt/apache-tomcat-8.5.72/webapps/manager/META-INF/context.xml 
2. /opt/apache-tomcat-8.5.72/webapps/host-manager/META-INF/context.xml

#lines to comment
<!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
