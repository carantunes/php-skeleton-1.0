#!/usr/bin/env bash

composer install

# Use single quotes instead of double quotes to make it work with special-character passwords
PASSWORD='12345678'
PORT=82

sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"

# setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:${PORT}>
    DocumentRoot "$PWD/public"
    <Directory "$PWD/public">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" | sudo tee  /etc/apache2/sites-available/twitch-sample.conf
# enable port
echo "Listen ${PORT}" | sudo tee --append /etc/apache2/ports.conf
# enable site
sudo a2ensite twitch-sample.conf
# reload apache
service apache2 reload


# run SQL statements from MINI folder
sudo mysql -h "localhost" -u "root" "-p${PASSWORD}" < "$PWD/_install/01-create-database.sql"
sudo mysql -h "localhost" -u "root" "-p${PASSWORD}" < "$PWD/_install/02-create-table-song.sql"
sudo mysql -h "localhost" -u "root" "-p${PASSWORD}" < "$PWD/_install/03-insert-demo-data-into-table-song.sql"


# put the password into the application's config. This is quite hardcore, but why not :)
sudo sed -i "s/your_password/${PASSWORD}/" "$PWD/application/config/config.php"

# final feedback
echo "Voila!"
