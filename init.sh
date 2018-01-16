#!/bin/bash

SERVERADDRESS=${ADDRESS:-localhost}
SERVERPASSWORD=${PASSWORD:-password}
SERVERPORT=${PORT:-64738}

sed -i "s|SERVERADDRESS|$SERVERADDRESS|;s|SERVERPASSWORD|$SERVERPASSWORD|;s|SERVERPORT|$SERVERPORT|" config.yml

/etc/init.d/mpd start
ruby bot.rb
