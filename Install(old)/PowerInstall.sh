echo 'Changing Power Settings'
sudo apt install gparted
sudo apt install dconf-cli dconf-editor
cd
sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=hibernate/' /etc/systemd/logind.conf
sudo sed -i 's/#HandleLidSwitchExternalPower=suspend/HandleLidSwitchExternalPower=hibernate/' /etc/systemd/logind.conf
cd
sudo sed -i 's/GRUB_TIMEOUT=20/GRUB_TIMEOUT=2/' /etc/default/grub  
#sudo sed -i 's/#HandleLidSwitchDocked=ignore/HandleLidSwitchDocked=ignore/' /etc/systemd/logind.conf
#sudo sed -i 's/#HandlePowerKey=poweroff/HandlePowerKey=suspend\nHandlePowerKeyLongPress=poweroff/' /etc/systemd/logind.conf
#sudo sed -i 's/#HibernateDelaySec=180min/HibernateDelaySec=20min/' /etc/systemd/sleep.conf

#open dconf editor

