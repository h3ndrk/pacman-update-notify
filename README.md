# pacman-update-notify

Get notified when the package manager [pacman](https://www.archlinux.org/pacman/) has some available updates.

This code uses [systemd](https://wiki.freedesktop.org/www/Software/systemd/) and `notify-send` to achieve desktop notifications for available updates for the system. It is an interactive interface between the package manager [pacman](https://www.archlinux.org/pacman/). It checks periodically for updates.

In addition to the update process another script will keep the pacman mirrorlist up to date. As a result the used mirrors are validated every day and will be sorted by access delay and speed.

## Installation

To install use the program `make` (**root privileges required**):

    # make install
    
        Generates all scripts, services and timers and installs them to the
        correct locations. As a result the timer is started and will be
        started at every following boot.
    
    # make uninstall
    
        Removes and disables all scripts, services and timers. Also cleans up
        the source code directory.

**Note that you must change the username in the `Makefile`.** Without the change notifications won't be displayed.

The default startup delay at boot is set to `5` minutes and the default interval of the synchronization is set to `30` minutes. Feel free to modify these settings in the `Makefile`.

In the `pacman-update-mirrorlist.sh`-script it is possible to change the country of the mirrors. Feel free to modify the download link in the script file. Defaultly the script will download the mirrorlist from:

    https://www.archlinux.org/mirrorlist/?country=all&protocol=http&protocol=https&ip_version=4

## License

lastest GPL-license (see LICENSE-file)

Copyright (C) 2015 NIPE-SYSTEMS, [http://www.nipe-systems.de](http://www.nipe-systems.de)
