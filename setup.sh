# get to current working directory
cwd=$(pwd)

# setup user specific applications
mkdir ~/local
mkdir ~/local/bin  # command binaries
mkdir ~/local/lib  # applications

# install oh-my-zsh
cd ~/local
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install dotfiles
cd ~/local/lib
git clone https://github.com/bmweiner/dotfiles
cd dotfiles
sh rmdot.sh
sh lndot.sh

# install terminal profile
cd ~/local/lib
git clone https://github.com/bmweiner/macos_setup
open macos_setup/config/bmw.terminal

# configure macOS features by XML plist

# terminal plist
defaults write com.apple.terminal "Default Window Settings" "bmw"
defaults write com.apple.terminal "Startup Window Settings" "bmw"

# dock plist
defaults write com.apple.dock static-only -bool true
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

# finder plist
defaults write com.apple.finder SidebarTagsSctionDisclosedState -int 0
defaults write com.apple.finder SidebariCloudDriveSectionDisclosedState -int 0
killall Finder

# return to current working directory
cd $cwd
