sudo add-apt-repository ppa:boltgolt/howdy
sudo apt install v4l-utils
sudo apt install howdy
sudo sed -i 's+device_path = /dev/v4l/by-path/none+device_path = /dev/video0+g' /usr/lib/security/howdy/config.ini

sudo howdy add
exit
