echo 'Installing Fingerprint scanner and Face Scaner dependencies'
cd Documents/Install

sudo apt install libfprint-2-2
sudo apt install libfprint-2-tod1
sudo dpkg -i libfprint-2-tod1-goodix_0.0.6-0ubuntu1~somerville1_amd64.deb
sudo apt-get install libpam-fprintd
sudo pam-auth-update

#sudo sh -c 'cat > /etc/apt/sources.list.d/focal-dell.list << EOF
#deb http://dell.archive.canonical.com/updates/ focal-dell public
## deb-src http://dell.archive.canonical.com/updates/ focal-dell public

#deb http://dell.archive.canonical.com/updates/ focal-oem public
## deb-src http://dell.archive.canonical.com/updates/ focal-oem public

#deb http://dell.archive.canonical.com/updates/ focal-somerville public
## deb-src http://dell.archive.canonical.com/updates/ focal-somerville public

#deb http://dell.archive.canonical.com/updates/ focal-somerville-melisa public
## deb-src http://dell.archive.canonical.com/updates focal-somerville-melisa public
#EOF'
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F9FDA6BED73CDC22
#sudo apt update -qq

#sudo apt install oem-somerville-melisa-meta libfprint-2-tod1-goodix oem-somerville-meta tlp-#config -y

#sudo add-apt-repository ppa:boltgolt/howdy -y
#sudo apt update -qq
#sudo apt install howdy -y
