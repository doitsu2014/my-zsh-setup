if [ "$(uname)" == "Darwin"  ]; then
    brew install zsh
    chsh -s /usr/local/bin/zsh
    brew install --cask alacritty

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux"  ]; then
    # this if statement is used to install dependency packages of ubuntu which has the version > 16.x.x
    sudo apt-get install zsh -y
    chsh -s $(which zsh)

    # install alacritty
    sudo add-apt-repository ppa:mmstick76/alacritty
    sudo apt install alacritty
fi

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
bash ./copy-zshrc.sh
bash ./install_nerd_fonts.sh

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
