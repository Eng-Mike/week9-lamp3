#!/bin/bash

# Set MySQL config variables
#!/bin/bash

# Set MySQL config variables
db_username="oracle"
db_user_password="school1"
db_name="webserver"

# Update the CentOS 7 server
sudo yum update -y

# Install Apache, MySQL, PHP, and additional packages
sudo yum install httpd mariadb-server php php-mysql php-gd wget -y

# Start the httpd daemon
sudo systemctl start httpd

# Enable the httpd daemon
sudo systemctl enable httpd

# Get the status of httpd daemon
sudo systemctl status httpd

# Start MySQL service 
sudo systemctl start mariadb

# Enable MySQL service
sudo systemctl enable mariadb

# Change OWNER and permission of directory /var/www
usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
find /var/www -type d -exec chmod 2775 {} ";"
find /var/www -type f -exec chmod 0664 {} ";"

# Download WordPress package and extract
wget http://wordpress.org/wordpress-5.1.1.tar.gz
tar -xzvf wordpress-5.1.1.tar.gz
rm -f wordpress-5.1.1.tar.gz
cp -r wordpress/* /var/www/html/

# AUTOMATIC mysql_secure_installation

# Create database, database user, and grant privileges
mysql -u root -e "CREATE DATABASE $db_name;"
mysql -u root -e "CREATE USER '$db_username'@'localhost' IDENTIFIED BY '$db_user_password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_username'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Create WordPress configuration file and update database values
cd /var/www/html
cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$db_name/g" wp-config.php
sed -i "s/username_here/$db_username/g" wp-config.php
sed -i "s/password_here/$db_user_password/g" wp-config.php
cat <<EOF >> wp-config.php

define( "FS_METHOD", "direct" )";"
define("WP_MEMORY_LIMIT", "256M")";"
EOF

# Enable Apache and MySQL and restart Apache
sudo systemctl enable httpd
sudo systemctl enable mariadb
sudo systemctl restart httpd

db_user_password="school1"
db_name="webserver"

# Update the CentOS 7 server
sudo yum update -y

# Install Apache, MySQL, PHP, and additional packages
sudo yum install httpd mariadb-server php php-mysql php-gd wget -y

# Start the httpd daemon
sudo systemctl start httpd

# Enable the httpd daemon
sudo systemctl enable httpd

# Get the status of httpd daemon
sudo systemctl status httpd

# Start MySQL service 
sudo systemctl start mariadb

# Enable MySQL service
sudo systemctl enable mariadb

# Change OWNER and permission of directory /var/www
usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
find /var/www -type d -exec chmod 2775 {} ";"
find /var/www -type f -exec chmod 0664 {} ";"

# Download WordPress package and extract
wget http://wordpress.org/wordpress-5.1.1.tar.gz
tar -xzvf wordpress-5.1.1.tar.gz
rm -f wordpress-5.1.1.tar.gz
cp -r wordpress/* /var/www/html/

# AUTOMATIC mysql_secure_installation

# Create database, database user, and grant privileges
mysql -u root -e "CREATE DATABASE $db_name;"
mysql -u root -e "CREATE USER '$db_username'@'localhost' IDENTIFIED BY '$db_user_password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_username'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Create WordPress configuration file and update database values
cd /var/www/html
cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$db_name/g" wp-config.php
sed -i "s/username_here/$db_username/g" wp-config.php
sed -i "s/password_here/$db_user_password/g" wp-config.php
cat <<EOF >> wp-config.php

define( "FS_METHOD", "direct" )";"
define("WP_MEMORY_LIMIT", "256M")";"
EOF

# Enable Apache and MySQL and restart Apache
sudo systemctl enable httpd
sudo systemctl enable mariadb
sudo systemctl restart httpd
