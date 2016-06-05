#install mysql
apt-get install mysql-server php5-mysql
mysql_install_db
mysql_secure_installation

#install phpmyadmin
apt-get install phpmyadmin
php5enmod mcrypt
service apache2 restart
