#!/usr/bin/env bash

# Use single quotes instead of double quotes to make it work with special-character passwords

PORT=81

# setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:${PORT}>
    DocumentRoot "$PWD/public"
    ErrorLog $PWD/error.log
	CustomLog $PWD/access.log combined
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


# go to project folder, load Composer packages (not necessary by default)
composer update
