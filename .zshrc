# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Plugins
plugins=(git docker docker-compose kubectl helm)

source $ZSH/oh-my-zsh.sh

# zplug
source ~/.zplug/init.zsh
zplug "wting/autojump"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install missing plugins silently
if ! zplug check; then
    zplug install
fi
zplug load

# PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"

# Linux-specific paths
if [[ "$(uname)" == "Linux" ]]; then
    export PATH=$PATH:/usr/bin/nvim-linux64/bin
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"

# Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bash ~/hello.sh
