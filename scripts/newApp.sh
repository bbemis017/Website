APP_NAME=$1
MAX_APPS=20

#Get number of active apps
APPS=`find /var/www -maxdepth 1 | wc -l`
APPS=`expr $APPS - 1`

#check if app limit has been reached
if [ "$APPS" -ge "$MAX_APPS" ]
then
	echo 'Too many ports in use, check aws security group'
fi

PORT=`expr 80 + $APPS - 1`
echo "port is: $PORT"

#add info to 000-default.conf.apache
VIRTUAL_HOST=../config/000-default.conf.apache
echo "<VirtualHost *:$PORT>" >> $VIRTUAL_HOST
echo "	ServerAdmin webmaster@localhost" >> $VIRTUAL_HOST
echo "	DocumentRoot /var/www/$APP_NAME/$APP_NAME/public/" >> $VIRTUAL_HOST
echo "	ServerName $APP_NAME" >> $VIRTUAL_HOST
echo "</VirtualHost>" >> $VIRTUAL_HOST

#add info to ports.conf.apache
CONFIG_PORTS=../config/ports.conf.apache
echo "Listen $PORT" >> $CONFIG_PORTS

#update apache files
cp ../config/ports.conf.apache /etc/apache2/ports.conf
cp ../config/apache2.conf.apache /etc/apache2/apache2.conf

service apache2 restart
