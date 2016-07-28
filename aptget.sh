#!/usr/bin/env bash

#required gets
sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get install -y apache2
sudo apt-get install -y php5


# enable mod_rewrite
sudo apt-get -y install mysql-server
sudo apt-get install php5-mysql

sudo apt-get -y install phpmyadmin