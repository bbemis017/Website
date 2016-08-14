APP_NAME=$1
#GITHUB=$2
MAX_APPS=20

#check argument list
if [ $# -lt 2 ]
then
	echo 'invalid argument list'
	exit
fi

#Get number of active apps
APPS=`find /var/www -maxdepth 1 | wc -l`
APPS=`expr $APPS - 1`

#check if app limit has been reached
if [ "$APPS" -ge "$MAX_APPS" ]
then
	echo 'Too many ports in use, check aws security group'
	exit
fi

#update app list
APP_LIST=../config/apps.txt
echo "$APP_NAME" >> $APP_LIST

#copy contents of prepend file to 000-default.conf.apache
PREPEND=../config/000-default.conf.prepend
APPEND=../config/000-default.conf.append
VIRTUAL_HOST=../config/000-default.conf.apache
cp $PREPEND $VIRTUAL_HOST

#create an alias for every app
while read -r line
do
	#do this for every app
	APACHE=/var/www/$APP_NAME/config/apache.conf
	while read -r line2
	do
		echo "    " $line2 >> $VIRTUAL_HOST
	done < $APACHE

	echo " " >> $VIRTUAL_HOST

done < "$APP_LIST"

#echo "</VirtualHost>" >> $VIRTUAL_HOST
cat $APPEND >> $VIRTUAL_HOST

#update apache files
cp ../config/apache2.conf.apache /etc/apache2/apache2.conf
cp $VIRTUAL_HOST /etc/apache2/sites-available/000-default.conf

#update repository on origin master
#git add $APP_LIST
#git commit -m "Configured $APP_NAME on server"
#git push origin master
#echo "commited changes to origin master"

service apache2 restart
