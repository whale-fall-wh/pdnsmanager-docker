#!/usr/bin/env sh

if [ ! -f /var/www/html/backend/config/ConfigUser.php ] && [ -n ${DB_HOST} ] && [ -n ${DB_USER} ] && [ -n ${DB_PASS} ] && [ -n ${DB_NAME} ]; then
    cat <<EOF>ConfigUser.php
<?php

return array (
  'db' =>
  array (
    'host' => '${DB_HOST}',
    'user' => '${DB_USER}',
    'password' => '${DB_PASS}',
    'dbname' => '${DB_NAME}',
    'port' => 3306,
  ),
);
EOF
fi

exec apache2-foreground
