#setup server application
apt-get install apache2

#setup framework and db
#sh setup_phalcon.sh
sh mysql_install.sh
sh install_php7.sh

#required for phpmyadmin
apt-get install php-mbstring php7.0-mbstring
phpenmod mbstring

#update code and config files
sh update_website.sh
