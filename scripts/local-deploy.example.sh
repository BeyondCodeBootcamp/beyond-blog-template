#!/bin/bash
set -e
set -u

bash ./build.sh
rsync -avhP ./public/ example.com:~/srv/www/example.com/
