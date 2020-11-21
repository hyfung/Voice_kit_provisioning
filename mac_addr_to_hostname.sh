#!/bin/bash
# This script should be executed by root using cron @reboot

MAC=$(ifconfig wlan0  | grep ether | grep -o '[0-9a-f]\+\:[0-9a-f]\+\:[0-9a-f]\+\:[0-9a-f]\+\:[0-9a-f]\+\:[0-9a-f]\+' | sed -r 's/://g')
echo $MAC > /etc/hostname
