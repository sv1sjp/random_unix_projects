#!/system/bin/sh
#Script to disable the HW Button Brightness in Android Devices. Tested in Xiaomi Mi Max 2 with both Android 10 and 11.
#Load this script on Boot

if [ -e /sys/class/leds/button-backlight/max_brightness ];
then
   sleep 1
   su -c "echo 0 > /sys/class/leds/button-backlight/max_brightness" 
fi;
