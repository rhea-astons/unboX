#!/bin/bash

############################################################
# COLORS
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'
# ICONS
SUCCESS="${GREEN}✓${NC}"
FAILED="${RED}✘"



############################################################
clear
printf "${GREEN}OS X Environment Configuration Script${NC}\n\n"



############################################################
SUDO_MISSING=$(sudo -n true 2>&1 | wc -l)
if [ $SUDO_MISSING = 1 ]; then
  printf "${ORANGE}⚠ Administration rights are needed for this script${NC}\n"
  sudo -v
else
  printf "☞ Checking for administration rights: ${SUCCESS}\n"
fi

SUDO_MISSING=$(sudo -n true 2>&1 | wc -l)
if [ $SUDO_MISSING = 1 ]; then
  printf "${FAILED} sudo has not been allowed ${NC}\n"
  echo
  exit -1
fi

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
echo



############################################################
printf "☞ Checking for SSH keys: "
if [[ -f ~/.ssh/id_rsa && -f ~/.ssh/id_rsa.pub ]]; then
  printf "${SUCCESS}\n"
else
  printf "${FAILED} Keys not found ${NC}\n"
  exit -1
fi
echo



############################################################
printf "☞ Cloning GIT repository: "
if [[ -d ~/.unboX ]]; then
  rm -rf ~/.unboX
fi
git clone git@github.com:rsnts/unboX.git ~/.unboX 2> ~/.unboX.log
if [ ! -d ~/.unboX ]; then
  printf "${FAILED} GIT clone failed (check log: ~/unboX.log)${NC}\n"
  exit -1
else
  printf "${SUCCESS}\n"
fi
echo



############################################################
printf "☞ Setting git: "
ln -sf ~/.unboX/git/.gitconfig ~/
ln -sf ~/.unboX/git/.gitignore_global ~/
printf "${SUCCESS}\n"



############################################################
printf "☞ Setting GIT username: ${GREEN}"
read GIT_USERNAME
printf "${NC}"
git config --global user.username $GIT_USERNAME
printf "☞ Setting GIT email: ${GREEN}"
read GIT_EMAIL
printf "${NC}"
git config --global user.email $GIT_EMAIL
printf "☞ Setting GIT name: ${GREEN}"
read GIT_NAME
printf "${NC}\n"
git config --global user.name "${GIT_NAME}"



############################################################
printf "☞ Setting computer name: ${GREEN}"
read COMPUTER_NAME
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"
printf "${NC}\n"



############################################################
printf "☞ Setting vim: "
ln -sf ~/.unboX/vim/.vimrc ~/
mkdir -p ~/.vim
ln -sf ~/.unboX/vim/colors ~/.vim/
printf "${SUCCESS}\n"



############################################################
printf "☞ Setting OS X preferences: "
source ~/.unboX/osx/preferences.sh
printf "${SUCCESS}\n"
echo



############################################################
printf "☞ Setting OS X sytem hacks: "
source ~/.unboX/osx/preferences.sh
printf "${SUCCESS}\n"
echo



############################################################
printf "☞ Homebrew installation. Press any key to start."
read key
clear
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"



############################################################
printf "☞ Brews installation."
source ~/.unboX/brew/brew.cfg
brew install ${brews[@]}



############################################################
printf "☞ Casks installation."
brew tap caskroom/versions
source ~/.unboX/brew/cask.cfg
brew cask install ${casks[@]}



############################################################
printf "☞ Fonts installation."
brew tap caskroom/fonts
source ~/.unboX/brew/fonts.cfg
brew cask install ${fonts[@]}



############################################################
printf "☞ Install Oh My Zsh."
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ln -sf ~/.unboX/zsh/.zshrc ~/
touch ~/.hushlogin
sudo /bin/sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh


############################################################
clear
printf "${GREEN}OS X Environment Configuration Script${NC}\n\n"
rm ~/.unboX.log
printf "${ORANGE}⚠ Setup done. Restart your system now${NC}\n"
echo
