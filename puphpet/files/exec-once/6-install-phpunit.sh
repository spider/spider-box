#!/usr/bin/env bash

echo "------------ INSTALL PHPUNIT START -----------"

### install php unit so it is the newest version

wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
mv phpunit.phar /usr/local/bin/phpunit

echo "------------ INSTALL PHPUNIT END ------------"