#setup server application
apt-get install apache2

#setup framework and db
#sh setup_phalcon.sh
sh mysql_install.sh 
sh install_php7.sh 

#update code and config files
sh update_website.sh
