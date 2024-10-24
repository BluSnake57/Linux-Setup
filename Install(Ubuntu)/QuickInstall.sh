#!/bin/bash

#bash ./QuickInstall.sh

sudo apt update
sudo apt upgrade

cd Documents/Install/

read -p "Install Face recognition [Y/N]" in
if [ "$in" == "y" ]; then
	sh FaceInstall.sh
fi

read -p "Install Finger recognition [Y/N]" in
if [ "$in" == "y" ]; then
	sh FingerInstall.sh
fi

read -p "Install Program settings [Y/N]" in
if [ "$in" == "y" ]; then
	sh ProgramsInstall.sh
fi

read -p "Install Power settings [Y/N]" in
if [ "$in" == "y" ]; then
	sh PowerInstall.sh
fi


