#!/bin/bash
set -e
set -u

bash ./build.sh
rsync -avhP ./public/ ~/srv/www/example.com/
