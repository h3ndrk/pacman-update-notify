#!/bin/sh

export DISPLAY=:0

UPDATES=`/usr/bin/pacman -Qqu`
UPDATES_RETURN=$?
if [ $UPDATES_RETURN -eq 0 ]
then
	UPDATE_AMOUNT=`/usr/bin/pacman -Qqu | sed -n '$='`
	
	if [ $UPDATE_AMOUNT -eq 1 ]; then
		/usr/bin/notify-send "1 update available" "Package: `/usr/bin/pacman -Qqu | while read pkg; do echo -n "$pkg, "; done | rev | cut -c 3- | rev`"
	else
		/usr/bin/notify-send "$UPDATE_AMOUNT updates available" "Packages: `/usr/bin/pacman -Qqu | while read pkg; do echo -n "$pkg, "; done | rev | cut -c 3- | rev`"
	fi
fi
