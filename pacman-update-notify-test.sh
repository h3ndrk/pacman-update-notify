#!/bin/sh

export DISPLAY=:0

# Query database and show notification if needed
UPDATES=`/usr/bin/pacman -Qqu`
UPDATES_RETURN=$?
if [ $UPDATES_RETURN -eq 0 ]
then
	/usr/bin/notify-send "Updates available" "Packages: `/usr/bin/pacman -Qqu | while read pkg; do echo -n "$pkg, "; done | rev | cut -c 3- | rev`"
fi
