#!/bin/bash

DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"

DOWNLOAD_DIR="$HOME/temp/discord_maj"

DISCORD_INSTALL_DIR="/usr/share/discord"

DEB_FILE="$DOWNLOAD_DIR/discord.deb"

sudo wget -O $DEB_FILE $DISCORD_URL

if [ $? -eq 0 ]; then
	echo "telechargement reussi."
	sudo dpkg -i $DEB_FILE
	if [ $? -eq 0 ]; then
		echo " Discord mis a jour ."
	else
		echo "the installation it's aborted. tentative correction of dependance"
		sudo apt-get install -f
	fi
else
	echo "echec."
fi
rm $DEB_FILE
$DISCORD_INSTALL_DIR/Discord
