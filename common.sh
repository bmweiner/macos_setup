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