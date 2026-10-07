#!/usr/bin/env bash
set -e

# Run from the repo directory so relative paths (copy-zshrc.sh, .zshrc, ...) resolve
cd "$(dirname "$0")"

OS="$(uname -s)"
ZSH_DIR="${ZSH:-$HOME/.oh-my-zsh}"
ZPLUG_DIR="${ZPLUG_HOME:-$HOME/.zplug}"

install_or_upgrade_zsh() {
    case "$OS" in
        Darwin)
            if brew list zsh &>/dev/null; then
                brew upgrade zsh || true
            else
                brew install zsh
            fi
            ;;
        Linux)
            sudo apt-get update
            if dpkg -s zsh &>/dev/null; then
                sudo apt-get install --only-upgrade zsh -y
            else
                sudo apt-get install zsh -y
            fi
            ;;
    esac
}

set_default_shell() {
    local zsh_path
    zsh_path="$(command -v zsh)"
    if [ "$(basename "$SHELL")" != "zsh" ]; then
        chsh -s "$zsh_path"
    fi
}

install_or_update_oh_my_zsh() {
    if [ -d "$ZSH_DIR" ]; then
        echo "Updating oh-my-zsh..."
        ZSH="$ZSH_DIR" zsh -f "$ZSH_DIR/tools/upgrade.sh" || git -C "$ZSH_DIR" pull --rebase --stat
    else
        echo "Installing oh-my-zsh..."
        # --unattended: don't switch into zsh or change shell; --keep-zshrc: we copy our own
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
    fi
}

install_or_update_zplug() {
    if [ -d "$ZPLUG_DIR" ]; then
        echo "Updating zplug..."
        git -C "$ZPLUG_DIR" pull --rebase --stat
    else
        echo "Installing zplug..."
        curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    fi
}

install_or_update_zplug_plugins() {
    echo "Installing/updating zplug plugins..."
    # Load only the zplug section of .zshrc so oh-my-zsh/p10k don't run in a non-interactive shell
    zsh -c "
        source '$ZPLUG_DIR/init.zsh'
        $(grep -E '^zplug "' ~/.zshrc)
        zplug check || zplug install
        zplug update
    "
}

if command -v zsh &>/dev/null; then
    echo "zsh is already installed, updating zsh, oh-my-zsh, zplug and plugins..."
else
    echo "Installing zsh..."
fi

install_or_upgrade_zsh
set_default_shell
install_or_update_oh_my_zsh
install_or_update_zplug
bash ./copy-zshrc.sh
install_or_update_zplug_plugins

echo ""
echo "======================================================"
echo " Installation complete!"
echo " Please restart your terminal or run: source ~/.zshrc"
echo " Note: This theme uses Powerlevel10k. For the best"
echo " experience, use a Nerd Font in your terminal."
echo " Recommended: https://www.nerdfonts.com"
echo "======================================================"
echo ""
