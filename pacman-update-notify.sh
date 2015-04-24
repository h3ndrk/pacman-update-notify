#!/bin/sh

# Copyright (C) 2015 NIPE-SYSTEMS
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
