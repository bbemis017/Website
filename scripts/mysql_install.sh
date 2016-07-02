#install mysql
apt-get install mysql-server
mysql_install_db
mysql_secure_installation

#install phpmyadmin
apt-get install phpmyadmin
php7.0enmod mcrypt
service apache2 restart
