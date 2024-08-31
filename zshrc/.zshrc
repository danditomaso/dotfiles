# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# # oh my zsh
# export ZSH="$HOME/.config/oh-my-zsh"
# export BASE_HOME="/Users/dand/"
#
# ZSH_THEME="powerlevel10k/powerlevel10k"
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
#
# plugins=(git z tmux zsh-autosuggestions node npm brew eza fzf kubectl)


# # oh-my-zsh
# export ZSH_AUTOSUGGEST_STRATEGY=(
#     history
#     completion
# )

# fzf
export FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down --preview 'bat --color=always{}'"
eval "$(fzf --zsh)"

# git
export GIT_EDITOR=nvim

# starship.rs
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# zoxide
eval "$(zoxide init zsh)"

export LIBRARY_BASE_HOME="/Users/dand/Library"
export GO_HOME="$BASE_HOME/go"
export PNPM_HOME="$LIBRARY_BASE_HOME/pnpm"
export BUN_HOME="$HOME/.bun"
export PYTHON_HOME="$LIBRARY_BASE_HOME/Python/3.11/"
export LVIM_HOME="$BASE_HOME/.local/bin"
export POSTGRES_HOME="/opt/homebrew/opt/libpq/bin"
export GOBIN=$GO_HOME/bin
export GOPATH=$GO_HOME

export PATH=$PATH:$GO_PATH:$PNPM_HOME:$PYTHON_HOME:$GOBIN:$LVIM_HOME:$BUN_HOME:$POSTGRES_HOME

# ssh-agent# Start the ssh-agent and add all identities
eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add  --apple-use-keychain ~/.ssh/id_ed25519 > /dev/null 2>&1
ssh-add  --apple-use-keychain ~/.ssh/id_ed25519_skolem > /dev/null 2>&1

# direnv hook
SHELL=/usr/bin/zsh tmux
export ZSH_TMUX_AUTOSTART=true

# # source files for rust and oh my zsh
# source $ZSH/oh-my-zsh.sh
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/Users/dand/.bun/_bun" ] && source "/Users/dand/.bun/_bun"


# aliases
# alias omzr="omz reload"
alias bruh="bun run --hot"
alias editzsh="code ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias add_cc_commit="curl -o- https://raw.githubusercontent.com/tapsellorg/conventional-commits-git-hook/master/scripts/install.sh | sh"
alias c="clear"
alias cat="bat"
alias ff='nvim $(fzf --preview="cat {}")'
# gmo -> git merge origin
alias gmo='git checkout $(git remote show origin | grep "HEAD branch" | cut -d " " -f5) && git pull && git checkout - && git merge $(git remote show origin | grep "HEAD branch" | cut -d " " -f5)'
# gcw -> git commit "work in progress"
alias gcw='git commit -m "wip" --no-verify'
alias gc='git commit -m' 
alias gl='git log --oneline' 
alias gpo='git push origin'
alias gs='git status'
# vi -> open vim
alias vi="nvim"
# vim -> open neovim
alias vim="nvim"
# ks -> kill tmux server
alias ks="tmux kill-server"
# exa -> ls
alias ls="eza"
alias l="eza -l"
alias lt="eza -tree"
#alias -g ls="exa -1 --color=auto"
# lazygit
alias lg="lazygit"
alias sourcezsh="source ~/.dotfiles/.zshrc"
alias editzsh="code ~/.zshrc"
# alias rec="cd ~/Downloads && yt-dlp -f bestvideo+bestaudio --merge-output-format mp4"
alias rec-audio="cd ~/Downloads && yt-dlp -f audio_only  --cookies-from-browser firefox  -N 2"
alias rec="cd ~/Downloads && yt-dlp -f 480p  --cookies-from-browser firefox  -N 2"
alias listformats="yt-dlp --list-formats"
#alias cat="~/.cargo/bin/bat"
alias gtgd="~/Library/CloudStorage/GoogleDrive-dan.ditomaso@gmail.com/My Drive"
alias docker-ports="docker container ls --format 'table {{.ID}}\t{{.Names}}\t{{.Ports}} -a'"
