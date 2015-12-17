#!/usr/bin/env bash

echo "------------ INSTALL NEO4J START -----------"


### install neo4j

export GREMLINSERVER_VERSION="3.0.2"
export NEO4J_VERSION="2.3.1"
export ORIENT_VERSION="2.1.8"

export INSTALL_DIR="/home/vagrant"
export VAGRANT_DIR="/vagrant"
export BOOTSTRAP_DIR="/var/www/puphpet/files/exec-once"

# install Neo4j locally:
wget -O $INSTALL_DIR/neo4j-community-$NEO4J_VERSION-unix.tar.gz dist.neo4j.org/neo4j-community-$NEO4J_VERSION-unix.tar.gz
tar -xzf $INSTALL_DIR/neo4j-community-$NEO4J_VERSION-unix.tar.gz -C $INSTALL_DIR/

sed -i 's/#org.neo4j.server.webserver.address=0.0.0.0/org.neo4j.server.webserver.address=0.0.0.0/' $INSTALL_DIR/neo4j-community-$NEO4J_VERSION/conf/neo4j-server.properties

echo "------------ INSTALL NEO4J END ------------"