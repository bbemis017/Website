#update website code
#git pull origin master

#update configuration files
cp ../config/000-default.conf.apache /etc/apache2/sites-available/000-default.conf
cp ../config/ports.conf.apache /etc/apache2/ports.conf
cp ../config/apache2.conf.apache /etc/apache2/apache2.conf

#restart apache
service apache2 restart
