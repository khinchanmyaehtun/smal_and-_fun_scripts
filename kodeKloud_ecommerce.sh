#!/bin/bashi
# This scirpt automates the deployment of Kodekloud e-commerce application and it's a  lab on shell script lessions.
# callout: to make a reference.

########################################
# Print a given message in color
# Arguments:
# Color:   e.g: green , red or others
#########################################

function print_color() {
	case $1 in
		"green") COLOR="\033[0;32m" ;;
		"red") COLOR="\033[0;31m" ;;
		"*") COLOR="\033[0m" ;;
	esac
	echo -e "${COLOR} $2 ${NC}"
} 


########################################
# Check the status of a given service. Error and exit if not active
# Arguments:
# Service: eg: httpd, firewalld
#########################################

function check_service_status(){
	is_service_active=$(systemctl is-active $1)
	if [ $is_service_active = "active" ]
then
        print_color "green" "$1 is active"
else

	print_color "red" "$1 is not active"
        exit 1
 fi
}


########################################
# Check if a port is enabled in a firewall rule
# Arguments:
# Port:   e.g: 80,3306
#########################################

function is_firewalld_rule_configured(){
	firewalld_ports=$(sudo firewalld-cmd --list-all --zone=public | grep ports)

	if [[ $firewalld_ports = *$1* ]]
then 
        print_color "green" "Port $1 configured"
else
        print_color "red" "Port $1 not configured"
fi

}


########################################
# Check if an item is present in a given web page
# Arguments:
# Webpage
# Item
#########################################

function check_item(){
	web_page=$(curl://localhost)     
if [[ $1 = *$2* ]]
then        
        print_color "green" "Item Laptop is present on the web page"
else       
        print_color "red" "Item Laptop is not present on the web page"
fi
}

#-------------------Database Configuration---------------
#Install and configure firewallD
print_green "Installing firewalld ..."
sudo yum install -y firewalld
sudo service firewalld start
sudo systemctl enable firewalld

check_service_status firewalld


#Install and configure MariaDB
print_color "green" "Installing MariaDB..."
sudo yum install -y mariadb-server
sudo service mariadb start
sudo systemctl enable mariadb

check_service_status mariadb


#Add Firewall rules for Database
print_color "green" "Adding Firewall rules for DB..."
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload

is_firewalld_rule_configured 3306


#Configure Database
print_color "green" "Configuring DB..."
cat > configure-db.mysql <<-EOF
CREATE DATABASE ecomdb;
CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
FLUSH PRIVILEGES;
EOF

sudo mysql < configure-db.mysql

#Load Inventory data into database
print_color "green" "Loading inventory data into DB..."
cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;


INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
EOF

sudo mysql < db-load-script.sql


mysql_db_results=$(sudo mysql -e "use ecomdb; select * from products;")

if [[ $mysql_db_results = *Laptop* ]]
then
	print_color "green" "Inventory data loaded"
else
	print_color "red" "Inventory data not loaded"
fi

#--------------------Web Server Configuration-------------------
#Install Apache Webserver and php
print_color "green" "Configuring Web Server..."
sudo yum install -y httpd php php-mysql

#Configure firewall rules for webserver
print_color "green" "Configuring FirewallD..."
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload

is_firewalld_rule_configured 80

sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf
 

#Start and enable httpd service
print_color "green" "Starting the web server ..."
sudo service httpd start
sudo systemctl enable httpd

check_service_status httpd
#Install Git and sourve code repository
print_color "green" "Installating Git and clone the source code ..."
sudo yum install -y git
sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/


#Replace databaseIP with localhost
sudo sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php

print_color "green" "Successful!!!!!"

for item in Laptop Drone VR Watch
do 
	check_item "$web_page" $item
done
