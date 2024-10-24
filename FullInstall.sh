#Settings
automatic='Y'
verbose='N'

args=""

#Drivers
nvidia='N'

#Programming Languages
java='Y'
cpp='Y'
csharp='Y'

#Programs
vscode='Y'
wireshark='Y'
unity='Y'
steam='Y'
lutris='Y'
wine='Y'
chrome='Y'
docker='Y'
vesktop='Y'
krita='Y'
echo $automatic
if [ $automatic = 'Y' ]; then
	echo "test"
	args+=" $args"
fi

if [ $verbose = 'N' ]; then
	args+=" -q"
fi

echo 'This is intended for Fedora 40 [Y/N]'
read -p "While it may work on newer versions it is not a guarantee: " in
if [ "$in" != "Y" ]; then
	break
fi

sudo dnf update $args

if [ "$nvidia" = 'Y' ]; then
	echo 'Is Secure Boot DISABLED? [Y/N]'
	read -p "If not please disable secure boot before proceeding: " in
	if [ "$in" != "y" ]; then
		break
	fi

	echo 'Adding Nvidia Repository'
	sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

	echo 'Installing Nvidia Drivers'
	sudo dnf update -y
	sudo dnf install kernel-devel
	sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda

	echo 'Starting Nvidia Service'
	sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service nvidia-powerd.service
	
	# echo 'Installing Nvidia Drivers'
	# sudo dnf install akmod-nvidia $args
	# sudo dnf install kernel-devel $args
	# sudo dnf install xorg-x11-drv-nvidia-cuda $args

	# echo 'Signing Nvidia Drivers'
	# sudo dnf install kmodtool akmods mokutil openssl
	# sudo kmodgenca -a
	# sudo mokutil --import /etc/pki/akmods/certs/public_key.der
	# sudo akmods --force
	# sudo dracut --force
fi

echo 'Installing Dependencies'
sudo dnf install flatpak $args
sudo dnf install pkg-config $args

echo 'Installing Code Development Kits'
#sudo dnf install java-latest-openjdk-devel $args

if [ $java = 'Y' ]; then
	sudo dnf install java-latest-openjdk $args
fi

#sudo dnf install openjfx $args

if [ $cpp = 'Y' ]; then
	sudo dnf install gcc $args
	sudo dnf install gcc-c++ $args
fi

if [ $csharp = 'Y' ] || [ unity = 'Y' ]; then
	sudo dnf install dotnet-sdk-3.1 $args
	sudo dnf install dotnet $args
fi

echo 'Installing Development Tools'

sudo dnf install flatseal $args

#Installing VS Code
if [ $vscode = 'Y' ]; then
	sudo flatpak install com.visualstudio.code $args
fi

#Installing Wireshark
if [ $wireshark = 'Y' ]; then
	sudo flatpak install fedora app/org.wireshark.Wireshark/x86_64/stable $args
fi

#Installing Docker
if [ $docker = 'Y' ]; then
	sudo dnf -y install dnf-plugins-core
	sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
	sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

#Installing Unity Hub
if [ $unity = 'Y' ]; then
	sudo flatpak install unityhub $args
fi

echo 'Installing Game Services'

if [ $steam = 'Y' ]; then
	sudo dnf install steam $args
fi

if [ $lutris = 'Y' ]; then
	sudo dnf install lutris $args
fi

if [ $wine = 'Y' ]; then
	sudo dnf install wine $args
fi

echo 'Installing Apps'

if [ $vesktop = 'Y' ]; then
	sudo flatpak install flathub dev.vencord.vesktop $args
fi

if [ $chrome = 'Y' ]; then
	sudo flatpak install flathub com.google.Chrome $args
fi

if [ $krita = 'Y' ]; then
	sudo flatpak install fedora app/org.kde.krita/x86_64/stable $args
fi

echo 'Installing DE tweaks'
sudo dnf install gnome-tweaks.noarch $args
sudo dnf install gnome-extensions-app $args
sudo dnf install gnome-shell-extension-dash-to-dock $args

if [ nvidia = 'Y' ]; then
	read -p "Would you like to restart to apply pending driver changes(highly reccommended) [Y/N]: " in
	if [ "$in" != "Y" ] ; then
		sudo reboot
	fi
fi


