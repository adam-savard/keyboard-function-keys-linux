#!/bin/bash

echo "#Copy keychron service to /etc/systemd/service"
sudo cp ./script/keychron.service /etc/systemd/system/keychron.service
echo "#Success"

sudo /bin/bash -c "echo 0 > /sys/module/hid_apple/parameters/fnmode"

echo "#Enable keychron service to make it run on next boot"
sudo systemctl enable keychron
echo "#Success"

echo "---Install process finish---"