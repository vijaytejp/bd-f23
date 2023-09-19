#!/bin/bash

# DO NOT RUN THIS!
# This is a work in progress. If this ends up in the class repo, ignore this. Do not run it.


echo ""
ecjp ""
echo "This script will remove any previous installation of Docker and upgrade to the latest version."
echo ""
echo "  NOTE: This should only be run on a Linux Xubuntu or Ubuntu installation (like Cyberhub)"
echo "You may get a message asking about overwriting a file; be sure to select Y (yes) to overwrite this file".
echo "If you have any issues with this, please copy the information you see from the output and send it to my"
echo "email (smith515@usf.edu)."
echo ""
echo "Best regards,"
echo "  Dr. Smith"
echo ""
echo ""
while true; do
    read -p "Do you wish to install this program? " -n1 yn
    case $yn in
        [Yy]* ) echo""; break;;
        [Nn]* ) echo ""; echo ""; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo apt-get remove docker-compose -y
sudo apt remove docker-ce -y
sudo apt autoremove -y

# Update Ubuntu to the latest
sudo apt-get update
sudo upt-get upgrade -y


# Add Docker's official GPG key:

sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# as of Sept 17/23, curl is not working when attempting to download this file. Look for a possible update
# from ubuntu soon.
#rm -f /usr/local/bin/docker-compose
#sudo curl -L "http://github.com/docker/compose/releases/download/v2.21.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose

sudo docker run hello-world

echo "If you saw the message 'Hello from Docker!' the installation was a success!"