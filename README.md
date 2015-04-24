# pacman-update-notify

Get notified when the package manager [pacman](https://www.archlinux.org/pacman/) has some available updates.

This code uses [systemd](https://wiki.freedesktop.org/www/Software/systemd/) and `notify-send` to achieve desktop notifications for available updates for the system. It is an interactive interface between the package manager [pacman](https://www.archlinux.org/pacman/). It checks periodically for updates.

## Installation

To install use the program `make`:

    #  make install
    
        Generates all scripts, services and timers and installs them to the
        correct locations. As a result the timer is started and will be
        started at every following boot.
    
    #  make uninstall
    
        Removes and disables all scripts, services and timers. Also cleans up
        the source code directory.

**Note that you must change the username in the `Makefile`.** Without the change notifications won't be displayed.

The default startup delay at boot is set to `5` minutes and the default interval of the synchronization is set to `30` minutes. Feel free to modify these settings in the `Makefile`.

## License

lastest GPL-license (see LICENSE-file)

Copyright (C) 2015 NIPE-SYSTEMS, [http://www.nipe-systems.de](http://www.nipe-systems.de)
