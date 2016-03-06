#!/usr/bin/env bash

echo "------------ INSTALL ORIENTDB START -----------"


### install orientdb

export GREMLINSERVER_VERSION="3.1.1"
export NEO4J_VERSION="2.3.2"
export ORIENT_VERSION="2.1.12"

export INSTALL_DIR="/home/vagrant"
export VAGRANT_DIR="/vagrant"
export BOOTSTRAP_DIR="/var/www/puphpet/files/exec-once"

# Download orient
wget -O $INSTALL_DIR/orientdb-community-$ORIENT_VERSION.tar.gz wget http://www.orientechnologies.com/download.php?file=orientdb-community-$ORIENT_VERSION.tar.gz
tar -xzf $INSTALL_DIR/orientdb-community-$ORIENT_VERSION.tar.gz -C $INSTALL_DIR/

### fix to make sure the orient install is also owned by root
chown -R root:root $INSTALL_DIR/orientdb-community-$ORIENT_VERSION

### update server.sh with correct user and path
sed -i '/ORIENTDB_DIR="YOUR_ORIENTDB_INSTALLATION_PATH"/ c\ORIENTDB_DIR="'$INSTALL_DIR'/orientdb-community-'$ORIENT_VERSION'"' $INSTALL_DIR/orientdb-community-$ORIENT_VERSION/bin/orientdb.sh
sed -i '/ORIENTDB_USER="USER_YOU_WANT_ORIENTDB_RUN_WITH"/ c\ORIENTDB_USER="root"' $INSTALL_DIR/orientdb-community-$ORIENT_VERSION/bin/orientdb.sh



### initial start of Orientdb to prime user data
sudo nohup $INSTALL_DIR/orientdb-community-$ORIENT_VERSION/bin/orientdb.sh start

sleep 15

### stop orientdb
sudo nohup $INSTALL_DIR/orientdb-community-$ORIENT_VERSION/bin/orientdb.sh stop

sleep 15

### set up the orientdb password for root
sed -i 's/password=".*" name="root"/password="root"  name="root"/' $INSTALL_DIR/orientdb-community-$ORIENT_VERSION/config/orientdb-server-config.xml


echo "------------ INSTALL ORIENTDB END ------------"