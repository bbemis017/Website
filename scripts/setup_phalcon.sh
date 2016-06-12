apt-get install php5 php5-dev php5-mysql gcc apache2 git
apt-get install libpcre3-dev libapache2-mod-php5
cd ~/
git clone --depth=1 git://github.com/phalcon/cphalcon.git
cd cphalcon/ext
sudo ./install
echo "extension=/usr/lib/php5/20121212/phalcon.so" > /etc/php5/mods-available/phalcon.ini
ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/apache2/conf.d/20-phalcon.ini
ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/cli/conf.d/20-phalcon.ini
a2enmod rewrite
service apache2 restart
cd /var/www/Website/scripts
