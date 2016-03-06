#!/bin/bash
echo "------------ START SYSTEM BOOTSTRAP ------------"

### set up necessary variables

export GREMLINSERVER_VERSION="3.1.0"
export NEO4J_VERSION="2.3.1"
export ORIENT_VERSION="2.1.12"

export INSTALL_DIR="/home/vagrant"
export VAGRANT_DIR="/vagrant"
export BOOTSTRAP_DIR="/var/www/puphpet/files/exec-once"

### make sure all the shell files have the same mod date
### this is only necessary so that they start in the proper order

find /var/www/puphpet -type f -name "*.sh" -exec touch '{}' \;


echo "------------ END SYSTEM BOOTSTRAP ------------"
