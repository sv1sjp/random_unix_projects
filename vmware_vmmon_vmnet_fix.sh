#!/bin/bash
#This script fixes fails to load VMMON and VMNET modules. Tested in Linux kernels 5.16.x in both Fedora and Arch linux. 
#If you run a later version of Vmware, replace the "16.1.2" from this script with your own version.

cd /tmp/vmware
wget https://github.com/mkubecek/vmware-host-modules/archive/workstation-16.2.1.tar.gz
tar -xzf workstation-16.2.1.tar.gz
cd  vmware-host-modules-workstation-16.2.1
make
sudo make install
echo "Now reboot your system and Vmware should work without any problem."