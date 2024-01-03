# oh my zsh
export ZSH="$HOME/.config/oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git z fnm node npm yarn brew fd fzf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Set bat's color theme

# aliases
alias omzr="omz reload"
alias c="clear"
# gmo -> git merge origin
alias gmo='git checkout $(git remote show origin | grep "HEAD branch" | cut -d " " -f5) && git pull && git checkout - && git merge $(git remote show origin | grep "HEAD branch" | cut -d " " -f5)'
# grb -> git checkout recent branch
alias grb='git branch --sort=-committerdate | grep -v "$(git branch --show-current)" | fzf --header "Checkout Recent Branch ( $(git branch --show-current))" --preview "git diff {1} --color=always" --pointer="" | xargs git checkout'
# gcw -> git commit "work in progress"
alias gcw='git commit -m "wip" --no-verify'
# code -> open vim
alias code="vim"
# vi -> open vim
alias vi="nvim" 
# vim -> open neovim
alias vim="nvim" 
# ks -> kill tmux server
alias ks="tmux kill-server"
# exa -> ls
alias ls="exa -1 --color=auto"
#alias -g ls="exa -1 --color=auto"
# lazygit
alias lg="lazygit"
# source zshrc
alias s="source ~/.zshrc"
alias cat="~/.cargo/bin/bat"



# functions
# fvim -> find and open a file in vim
function fvim() {
    if [[ $# -eq 0 ]]; then
        fd -t f | fzf --header "Open File in Vim" --preview "bat --color=always {}" | xargs nvim
    else
        fd -t f | fzf --header "Open File in Vim" --preview "bat --color=always {}" -q "$@" | xargs nvim
    fi
}

# vim -> open vim in the current directory or open the target file
function vim() {
    if [[ $# -eq 0 ]]; then
        nvim .
    else
        nvim "$@"
    fi
}

# fzf
export FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down --preview 'bat --color=always{}'"

# git
export GIT_EDITOR=nvim

# sapling
export EDITOR=nvim

# gpg
export GPG_TTY=$(tty) 

# starship.rs
export STARSHIP_CONFIG=~/.config/starship/config.toml
export STARSHIP_CACHE=~/.config/starship/cache
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# # fnm
# export PATH="/home/$USER/.local/share/fnm:$PATH"
# eval "`fnm env`"

# # opam configuration
# test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# bun completions
#[ -s "/Users/dand/.bun/_bun" ] && source "/Users/dand/.bun/_bun"

export BASE_HOME="/Users/dand/"
export LIBRARY_BASE_HOME="/Users/dand/Library"
export GO_HOME="$BASE_HOME/go"
export PNPM_HOME="$LIBRARY_BASE_HOME/pnpm"
export BUN_HOME="$HOME/.bun"
export PYTHON_HOME="$LIBRARY_BASE_HOME/Python/3.11/"
export LVIM_HOME="$BASE_HOME/.local/bin"
export GOBIN=$GO_HOME/bin
export GOPATH=$GO_HOME

export PATH=$PATH:$GO_PATH:$PNPM_HOME:$PYTHON_HOME:$GOBIN:$LVIM_HOME:$BUN_HOME
# # bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

# source rust config 
source $HOME/.cargo/env

# ssh-agent# Start the ssh-agent and add all identities
eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add  --apple-use-keychain ~/.ssh/id_ed25519 > /dev/null 2>&1
ssh-add  --apple-use-keychain ~/.ssh/id_ed25519_skolem > /dev/null 2>&1

# direnv hook
eval "$(direnv hook zsh)"

# # For compilers to find zlib you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"

# # For pkg-config to find zlib you may need to set:
# export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"


