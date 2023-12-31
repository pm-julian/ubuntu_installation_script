#!/bin/bash

# Anlegen des Root-Users
# Überprüfen, ob das Skript als Root ausgeführt wird
if [ "$EUID" -eq 0 ]; then
    echo "Dieses Skript sollte nicht als Root-Benutzer ausgeführt werden."
    exit 1
fi

# Benutzernamen festlegen
USERNAME="pm-root"

# Passwort vom Benutzer abfragen
read -s -p "Geben Sie das Passwort für den Benutzer $USERNAME ein: " PASSWORD
echo

# Benutzer erstellen und Shell-Zuweisung hinzufügen
sudo useradd -m -s /bin/bash $USERNAME

# Passwort für den Benutzer festlegen
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Benutzer zur sudo-Gruppe hinzufügen
sudo usermod -aG sudo $USERNAME

echo "Der Benutzer $USERNAME wurde erstellt und zur sudo-Gruppe hinzugefügt."



# Install Beginn
sudo apt-get update

# Postman
sudo snap install postman

# Git Hub Desktop
sudo apt install git -y

sudo wget https://github.com/shiftkey/desktop/releases/download/release-3.1.1-linux1/GitHubDesktop-linux-3.1.1-linux1.deb

sudo apt install gdebi-core -y

sudo gdebi GitHubDesktop-linux-3.1.1-linux1.deb -n

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# OpenVPN
sudo apt-get install openvpn -y

# Slack
sudo snap install slack --classic

# Flameshot
sudo apt install flameshot -y

# ZSH
sudo apt install zsh -y

# VSCode
sudo snap install --classic code

# Jetbrains toolbox
sudo apt install libfuse2
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

# Docker Compose
sudo apt-get install ca-certificates curl gnupg -y

sudo install -m 0755 -d /etc/apt/keyrings 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo curl -SL https://github.com/docker/compose/releases/download/v2.17.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

sudo chmod a+x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

if [ -z "$(cat /etc/group | grep docker)" ]; then
  sudo groupadd docker
fi

sudo usermod -aG docker $USER

sudo systemctl enable docker.service

sudo systemctl enable containerd.service




echo "";
echo "";
echo "";
echo "@@@  @@@   @@@@@@   @@@@@@@   @@@@@@@   @@@ @@@      @@@@@@@   @@@@@@   @@@@@@@   @@@  @@@  @@@   @@@@@@@@ "
echo "@@@  @@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@ @@@     @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@  @@@@ @@@  @@@@@@@@@ "
echo "@@!  @@@  @@!  @@@  @@!  @@@  @@!  @@@  @@! !@@     !@@       @@!  @@@  @@!  @@@  @@!  @@!@!@@@  !@@"
echo "!@!  @!@  !@!  @!@  !@!  @!@  !@!  @!@  !@! @!!     !@!       !@!  @!@  !@!  @!@  !@!  !@!!@!@!  !@!"
echo "@!@!@!@!  @!@!@!@!  @!@@!@!   @!@@!@!    !@!@!      !@!       @!@  !@!  @!@  !@!  !!@  @!@ !!@!  !@! @!@!@"
echo "!!!@!!!!  !!!@!!!!  !!@!!!    !!@!!!      @!!!      !!!       !@!  !!!  !@!  !!!  !!!  !@!  !!!  !!! !!@!!"
echo "!!:  !!!  !!:  !!!  !!:       !!:         !!:       :!!       !!:  !!!  !!:  !!!  !!:  !!:  !!!  :!!   !!:"
echo ":!:  !:!  :!:  !:!  :!:       :!:         :!:       :!:       :!:  !:!  :!:  !:!  :!:  :!:  !:!  :!:   !::"
echo "::   :::  ::   :::   ::        ::          ::        ::: :::  ::::: ::   :::: ::   ::   ::   ::   ::: ::::"
echo " :   : :   :   : :    :         :           :         :: :::   : :  :    :: :  :   :    ::    :    :: :: : "
echo "";
echo "";
echo "";

newgrp docker
