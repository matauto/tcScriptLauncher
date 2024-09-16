#!/bin/sh
#this script is run from script /opt/bootlocale.sh
#source /mnt/sda1/scripts/onboot_script.sh
/usr/local/etc/init.d/openssh start
/usr/local/bin/wifi.sh -a 2>&1 > /tmp/wifi.log
