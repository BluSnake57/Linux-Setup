echo 'Changing Power Settings'
sudo apt install gparted
sudo apt install dconf-cli dconf-editor
cd
sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=hibernate/' /etc/systemd/logind.conf
sudo sed -i 's/#HandleLidSwitchExternalPower=suspend/HandleLidSwitchExternalPower=hibernate/' /etc/systemd/logind.conf
sudo sed -i 's/#HandleLidSwitchDocked=ignore/HandleLidSwitchDocked=hibernate/' /etc/systemd/logind.conf
sudo sed -i 's/#HandlePowerKey=poweroff/HandlePowerKey=suspend\nHandlePowerKeyLongPress=poweroff/' /etc/systemd/logind.conf
sudo sed -i 's/#HibernateDelaySec=180min/HibernateDelaySec=20min/' /etc/systemd/sleep.conf

#open dconf editor

