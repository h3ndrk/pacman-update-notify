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

# the script will be started with the following username (important for X and
#   notify-send: this must be the username which should be notified)
USERNAME=nipesystems

# timer delay from boot
DELAY=5

# timer interval
INTERVAL=30

###########################  DO NOT EDIT FROM HERE  ###########################

# PHONY target
.PHONY: all invoke install-service install-timer install uninstall clean

all:

# Generate local service
pacman-update-notify.service: pacman-update-notify.service.template
	sed -e 's/USERNAME/$(USERNAME)/g' pacman-update-notify.service.template > pacman-update-notify.service # generate local service with username

# Generate local timer
pacman-update-notify.timer: pacman-update-notify.timer.template
	sed -e 's/DELAY/$(DELAY)/g' -e 's/INTERVAL/$(INTERVAL)/g' pacman-update-notify.timer.template > pacman-update-notify.timer # generate local timer with delay and interval

# Install local service to system
install-service: pacman-update-notify.service
	install -m 644 pacman-update-notify.service /etc/systemd/system/pacman-update-notify.service # install service

# Install local timer to system
install-timer: pacman-update-notify.timer
	install -m 644 pacman-update-notify.timer /etc/systemd/system/pacman-update-notify.timer # install timer
	systemctl start pacman-update-notify.timer # start timer for current session
	systemctl enable pacman-update-notify.timer # enable timer for every next session

# Install everything
install: install-service install-timer
	install -m 755 pacman-update-notify.sh /usr/bin/pacman-update-notify.sh # install script
	install -m 755 pacman-update-sync.sh /usr/bin/pacman-update-sync.sh # install script

# Uninstall everything and clean up
uninstall: clean
	systemctl stop pacman-update-notify.timer # stop timer for current session
	systemctl disable pacman-update-notify.timer # disable timer (clean up)
	rm -f /etc/systemd/system/pacman-update-notify.service # removing service
	rm -f /etc/systemd/system/pacman-update-notify.timer # removing timer
	rm -f /usr/bin/pacman-update-notify.sh # removing script
	rm -f /usr/bin/pacman-update-sync.sh # removing script

# Clean local generated service and timer
clean:
	rm -f pacman-update-notify.service # removing local generated service
	rm -f pacman-update-notify.timer # removing local generated timer