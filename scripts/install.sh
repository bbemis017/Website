#setup server application
apt-get install apache2

#setup framework and db
sh setup_phalcon.sh
sh mysql_install.sh 

#update code and config files
sh update_website.sh
