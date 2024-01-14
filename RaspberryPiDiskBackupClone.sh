#!/bin/bash
#Created by Dimitris Vagiakakos @sv1sjp  under GNU GPL v3.0+ . find more information on my website sv1sjp.github.io as my mastodon sv1sjp@fosstodon.org

#This Backup script can work in any Unix style system having dd,coreutils and dialog installed:
# for Raspbian/Debian/Ubuntu/LinuxMint or any other APT based distro:  sudo apt install dialog
# for Fedora or any RPM based distro: sudo dnf install dialog
# For Immutable Fedora (Silverblue, Core, etc): rpm-ostree install dialog

# Check if the script is running with root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

# Create menu using dialog
options=("Backup Operating System from SD Card/USB/SSD/NVMe" "Restore Operating System from SD Card/USB/SSD/NVMe" "Quit")
menu_response=$(dialog --clear --stdout --title "Raspberry Pi Backup Tool by @sv1sjp" --menu "Choose an action:" 15 40 3 1 "${options[0]}" 2 "${options[1]}" 3 "${options[2]}")
exit_status=$?
clear
if [ $exit_status != 0 ]; then
    echo "Cancelled by user"
    exit
fi

case $menu_response in
  1)
    
    device_list=$(df -h | awk '$1 ~ "^/dev/" {print $1, $2 "\n"}')
    prompt_message="Available Devices:\n$device_list\n\nEnter the device path for the SD card (e.g., /dev/sdb):"

    sd_device=$(dialog --title "Enter Device Path" --inputbox "$prompt_message" 20 60 3>&1 1>&2 2>&3)
    
    exit_status=$?
    clear
    if [ $exit_status != 0 ]; then
    	echo "Cancelled by user"
    	exit
    fi
    backup_dir=$(dialog --inputbox "Enter the destination directory for the backup:" 10 40 3>&1 1>&2 2>&3)
    clear
    if [ $exit_status != 0 ]; then
    	echo "Cancelled by user"
    	exit
    fi

    if [ ! -d "$backup_dir" ]; then
      echo "The specified directory does not exist. Creating directory..."
      mkdir -p "$backup_dir"
    fi

    backup_filename="TuxServerBackup_$(date '+%B_%d_%Y').img"
    backup_path="$backup_dir/$backup_filename"

    echo "Starting SD card backup. This may take some time..."
    dd if="$sd_device" of="$backup_path" bs=4M status=progress

    echo "Backup completed! The backup image is saved at: $backup_path"
    ;;
  2)
    img_file=$(dialog --inputbox "Enter the file path of the .img backup file:" 10 40 3>&1 1>&2 2>&3)
    exit_status=$?
    clear
    if [ $exit_status != 0 ]; then
    	echo "Cancelled by user"
    	exit
    fi
    
    device_list=$(df -h | awk '$1 ~ "^/dev/" {print $1, $2 "\n"}')
    prompt_message="Available Devices:\n$device_list\n\nEnter the device path for the SD card (e.g., /dev/sdb):"

    sd_device=$(dialog --title "Enter the device path for the SD card/USB/SSD/NVMe" --inputbox "$prompt_message" 20 60 3>&1 1>&2 2>&3)
    exit_status=$?
    clear
    if [ $exit_status != 0 ]; then
    	echo "Cancelled by user"
    	exit
    fi

    if [ ! -f "$img_file" ]; then
      echo "The specified image file does not exist. Exiting..."
      exit 1
    fi

    dialog --yesno "This will overwrite the SD card. Are you sure you want to continue?" 8 40
    exit_status=$?
    clear
    if [ $exit_status != 0 ]; then
    	echo "Cancelled by user"
    	exit
    fi
    response=$?
    clear

    if [ "$response" -eq 0 ]; then
      echo "Starting SD card restoration. This may take some time..."
      dd if="$img_file" of="$sd_device" bs=4M status=progress

      echo "Restore is completed! The SD card has been restored from the backup image."
    else
      echo "Restore operation canceled."
    fi
    ;;
  3)
    exit 0
    ;;
  *)
    echo "Invalid option. Please enter 1, 2, or 3."
    ;;
esac
