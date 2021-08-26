#!/bin/bash

server/ts3server_startscript.sh stop
echo "taking backup"
tim=$(date +%F_%T)
tar cfz backups/$tim.tar.gz server/
echo "backup saved to backups/$tim.tar.gz"

wget $(curl -s https://www.teamspeak.com/en/downloads/#server | grep -o 'https://files.teamspeak-services.com/releases/server/.*/teamspeak3-server_linux_amd64-.*.tar.bz2' | head -n1) -O ~/latest.tar.bz2

tar -xjf latest.tar.bz2 -C server/ --strip 1

rm -f latest.tar.bz2

server/ts3server_startscript.sh start
