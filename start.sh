#!/usr/bin/env sh

if [ ! -f /var/www/html/backend/config/ConfigUser.php ] && [ -n ${MYSQL_HOST} ] && [ -n ${MYSQL_USER} ] && [ -n ${MYSQL_PASS} ] && [ -n ${MYSQL_DB} ]; then
    cat <<EOF>/var/www/html/backend/config/ConfigUser.php
<?php

return array (
  'db' =>
  array (
    'host' => '${MYSQL_HOST}',
    'user' => '${MYSQL_USER}',
    'password' => '${MYSQL_PASS}',
    'dbname' => '${MYSQL_DB}',
    'port' => 3306,
  ),
);
EOF
fi

exec apache2-foreground
