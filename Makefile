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

USERNAME=hendrik

.PHONY: all invoke install uninstall clean

all:

invoke:
	systemctl start pacman-update-notify.service

pacman-update-notify.service: pacman-update-notify.service.template
	sed -e 's/USERNAME/$(USERNAME)/g' pacman-update-notify.service.template > pacman-update-notify.service

# Install and uninstall

install: pacman-update-notify.service
	install -m 644 pacman-update-notify.service /etc/systemd/system/pacman-update-notify.service
	install -m 755 pacman-update-notify.sh /usr/bin/pacman-update-notify.sh

uninstall:
	rm -f /etc/systemd/system/pacman-update-notify.service
	rm -f /usr/bin/pacman-update-notify.sh

clean:
	rm -f pacman-update-notify.service