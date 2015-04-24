#!/bin/sh

################################################################################
#                                                                              #
# Update Notify for Pacman by NIPE-SYSTEMS                                     #
# ----------------------------------------                                     #
#                                                                              #
# DESCRIPTION                                                                  #
#   This script will notify you if new updates are available for the package   #
#   manager "pacman" under Linux Arch. Follow the installation-instruction     #
#   underneath.                                                                #
#                                                                              #
# DEPENDENCIES                                                                 #
#   * pacman                                                                   #
#   * cron                                                                     #
#   * sudo                                                                     #
#   * xorg-server                                                              #
#   * libnotify + dependencies for your desktop                                #
#                                                                              #
# INSTALLATION                                                                 #
#   First of all you need to change your username below.                       #
#   Put this script in a directory you want and set the executable bit. Also   #
#   add this line to your global crontab (/etc/crontab):                       #
#   */30 * * * * root /path/to/your/script.sh                                  #
#   Make sure that the cron-daemon is running.                                 #
#                                                                              #
# UNINSTALL                                                                    #
#   To uninstall the notifier simply remove the line in the global crontab     #
#   (/etc/crontab). In addition you are able to remove this file.              #
#                                                                              #
# Copyright by NIPE-SYSTEMS                                                    #
# Further informations: http://www.nipe-systems.de                             #
#                                                                              #
################################################################################

# Change your username here
USERNAME="hendrik"

export DISPLAY=:0
export XAUTHORITY=/home/$USERNAME/.Xauthority

# Update package database
pacman -Sy &> /dev/null

# Query database and show notification if needed
UPDATES=`pacman -Qu`
UPDATES_RETURN=$?
if [ $UPDATES_RETURN -eq 0 ]
then
	UPDATES_AMOUNT=`pacman -Qu | sed -n '$='`
	if [ $UPDATES_AMOUNT -eq 1 ]
	then
		sudo -u $USERNAME /usr/bin/notify-send "Updates available" "There is 1 update ready to install."
	else
		sudo -u $USERNAME /usr/bin/notify-send "Updates available" "There are $UPDATES_AMOUNT updates ready to install."
	fi
fi
