echo 'Installing Nvidia Drivers'
sudo dnf update -y
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
modinfo -F version nvidia -y
sudo reboot
