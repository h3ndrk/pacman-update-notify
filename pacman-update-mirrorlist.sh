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

# Feel free to modify the download link for your purposes.

# your country in two-capital-letter-code, e.g. "US" or "DE"
COUNTRY="all"

###########################  DO NOT EDIT FROM HERE  ###########################

# Download mirrorlist
echo "Downloading mirrorlist..."
/usr/bin/curl --continue-at - --fail --silent "https://www.archlinux.org/mirrorlist/?country=$COUNTRY&protocol=http&protocol=https&ip_version=4" > /etc/pacman.d/mirrorlist.downloaded
# Uncomment mirrors
/usr/bin/sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.downloaded
# Sort mirrors by speed and delay
echo "Sorting mirrors..."
/usr/bin/rankmirrors /etc/pacman.d/mirrorlist.downloaded > /etc/pacman.d/mirrorlist
# Cleaning up
rm -f /etc/pacman.d/mirrorlist.downloaded
