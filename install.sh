if command -v zsh &>/dev/null; then
    echo "zsh is already installed, updating and recopying hello.sh..."
    if [ "$(uname)" == "Darwin" ]; then
        brew upgrade zsh
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        sudo apt-get update
        sudo apt-get install --only-upgrade zsh -y
    fi
    cp -r ./hello.sh ~/hello.sh
    cp -r ./.zshrc ~/.zshrc
else
    if [ "$(uname)" == "Darwin" ]; then
        brew install zsh
        chsh -s /usr/local/bin/zsh
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo 'start install zsh on Linux'
        sudo apt-get update
        sudo apt-get install zsh -y
        chsh -s $(which zsh)
    fi

    # install oh my zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # install zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

    bash ./copy-zshrc.sh
fi

echo ""
echo "======================================================"
echo " Installation complete!"
echo " Please restart your terminal or run: source ~/.zshrc"
echo " Note: This theme uses Powerlevel10k. For the best"
echo " experience, use a Nerd Font in your terminal."
echo " Recommended: https://www.nerdfonts.com"
echo "======================================================"
echo ""
