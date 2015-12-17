#!/usr/bin/env bash

echo "------------ INSTALL GREMLIN-SERVER START ------------"

###install gremlin-server

export GREMLINSERVER_VERSION="3.0.2"
export NEO4J_VERSION="2.3.1"
export ORIENT_VERSION="2.1.8"

export INSTALL_DIR="/home/vagrant"
export VAGRANT_DIR="/vagrant"
export BOOTSTRAP_DIR="/var/www/puphpet/files/exec-once"

export GREMLIN_DIR="apache-gremlin-server-$GREMLINSERVER_VERSION-incubating"

# download and unzip
wget --no-check-certificate -O $INSTALL_DIR/apache-gremlin-server-$GREMLINSERVER_VERSION-incubating-bin.zip https://www.apache.org/dist/incubator/tinkerpop/$GREMLINSERVER_VERSION-incubating/apache-gremlin-server-$GREMLINSERVER_VERSION-incubating-bin.zip
unzip $INSTALL_DIR/apache-gremlin-server-$GREMLINSERVER_VERSION-incubating-bin.zip -d $INSTALL_DIR/

# get gremlin-server configuration files
cp $BOOTSTRAP_DIR/gremlin-spider-script.groovy $INSTALL_DIR/$GREMLIN_DIR/scripts/
cp $BOOTSTRAP_DIR/gremlin-server-spider.yaml $INSTALL_DIR/$GREMLIN_DIR/conf/

# get neo4j dependencies
cd $INSTALL_DIR/$GREMLIN_DIR
bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin $GREMLINSERVER_VERSION-incubating
sleep 30
cd $VAGRANT_DIR

echo "------------ INSTALL GREMLIN-SERVER END ------------"