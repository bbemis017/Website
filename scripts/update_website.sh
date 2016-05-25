git pull origin master
cp ../config/000-default.conf.apache /etc/apache2/sites-available/000-default.conf
service apache2 restart
