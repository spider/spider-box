#!/bin/bash
echo "------------ RUNNING STARTUP COMMANDS -------------"

### Set variables
export GREMLINSERVER_VERSION="3.0.2"
export NEO4J_VERSION="2.3.1"
export ORIENT_VERSION="2.1.7"

export INSTALL_DIR="/home/vagrant"
export VAGRANT_DIR="/vagrant"


export GREMLIN_DIR="apache-gremlin-server-$GREMLINSERVER_VERSION-incubating"

export _JAVA_OPTIONS="-Djava.net.preferIPv4Stack=true"


## start gremlin-server
cd $INSTALL_DIR/$GREMLIN_DIR
sudo bin/gremlin-server.sh conf/gremlin-server-spider.yaml > /dev/null 2>&1 &
cd $VAGRANT_DIR
sleep 30

## start neo4j
sudo $INSTALL_DIR/neo4j-community-$NEO4J_VERSION/bin/neo4j start
sleep 15

# changing password:
sudo curl -vX POST http://neo4j:neo4j@localhost:7474/user/neo4j/password -d"password=j4oen"


## start the orient server
sudo nohup $INSTALL_DIR/orientdb-community-$ORIENT_VERSION/bin/orientdb.sh start

sleep 15

echo "------------ END: RUNNING STARTUP COMMANDS ------------"
