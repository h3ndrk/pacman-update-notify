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

.PHONY: all invoke install uninstall

all:

invoke:
	systemctl start pacman-update-notify-test.service

pacman-update-notify-test.service: pacman-update-notify-test.service.template
	sed -e 's/USERNAME/$(USERNAME)/g' pacman-update-notify-test.service.template > pacman-update-notify-test.service

# Install and uninstall

install: pacman-update-notify-test.service
	install -m 644 pacman-update-notify-test.service /etc/systemd/system/pacman-update-notify-test.service
	install -m 755 pacman-update-notify-test.sh /usr/bin/pacman-update-notify-test.sh

uninstall:
	rm -f /etc/systemd/system/pacman-update-notify-test.service
	rm -f /usr/bin/pacman-update-notify-test.sh

clean:
	rm -f pacman-update-notify-test.service