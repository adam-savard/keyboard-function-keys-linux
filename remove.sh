#!/bin/bash

echo "#Disable keychron service before delete service"
sudo systemctl disable keychron
echo "#Success"


echo "#Delete keychron service to /etc/systemd/service"
sudo rm /etc/systemd/system/keychron.service
echo "#Success"

echo "---Remove process finish---"