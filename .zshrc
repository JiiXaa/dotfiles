# ---------------------
# Powerlevel10k Instant Prompt
# ---------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------------------
# Oh My Zsh & Theme
# ---------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# ---------------------
# Plugins
# ---------------------
plugins=(
  git
  node
  npm
  z
  sudo
  command-not-found
  fzf
)

source $ZSH/oh-my-zsh.sh

# ---------------------
# Editor & Language
# ---------------------
export EDITOR="nvim"
export LANG="en_US.UTF-8"

# ---------------------
# Path Settings
# ---------------------
# export PATH="$PATH:$HOME/.local/bin:/usr/local/bin"
export PATH="$HOME/.local/bin:$PATH:/usr/local/bin"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# ---------------------
# FZF Integration
# ---------------------
export FZF_BASE="$HOME/.fzf"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ---------------------
# Aliases
# ---------------------
alias zrc="nvim ~/.zshrc"
alias reload='source ~/.zshrc && echo "zsh reloaded!"'
# Git
alias gs='git status'                            # Show current git status
alias gl='git log --oneline --graph --decorate'  # Compact git log with graph view
alias ga='git add .'                             # Stage all changes
alias gcm='git commit -m'                        # Commit with custom message
alias gam='git commit -am'                       # Add and commit changes in one step
alias gca='git commit --amend'                   # Amend last commit (opens editor)
alias gP='git push -u origin $(git branch --show-current)'  # Push current branch to origin
alias gp='git pull'                              # Pull latest changes from origin
alias gcl='git clone'                            # Clone a repository (requires URL)
alias gco='git checkout'                         # Switch branches or restore files
alias gcb='git checkout -b'                      # Create and switch to a new branch
alias gb='git branch'                            # List branches
alias gbd='git branch -d'                        # Delete a branch
alias gr='git restore'                           # Restore files to last committed state
alias grs='git restore --staged'                 # Unstage changes
alias gst='git stash'                            # Stash current changes
alias gstp='git stash pop'                       # Apply stashed changes
alias gd='git diff'                              # Show unstaged changes
alias gdc='git diff --cached'                    # Show staged changes
# Nvim
alias v='nvim'
alias vv='nvim .'
alias lg="lazygit"
alias vf='selected=$(fzf --preview "bat --style=numbers --color=always {}" --height=40%) && [ -n "$selected" ] && nvim "$selected"'  # Open selected file in Neovim only if selected
# zoxide aliases (smarter 'z' replacement)
alias zz='zoxide query -l'                           # List all known directories
alias zb='cd "$(zoxide query backend 2>/dev/null)"'  # Jump to backend dir if tracked
alias zf='cd "$(zoxide query frontend 2>/dev/null)"' # Jump to frontend dir if tracked
alias zclear='zoxide remove -a'                      # Clear zoxide history
zi() { cd "$(zoxide query --interactive)"; }         # Fuzzy cd with fzf
# fzf
# Open file in Neovim via fzf
fopen() {
  local selected
  selected=$(fzf --height=40%) || return 1
  [[ -n "$selected" ]] && nvim "$selected"
}
# Misc
alias install='sudo apt install'
alias update='sudo apt update'
alias uplist='apt list --upgradable'
alias upgrade='sudo apt upgrade'
alias remove='sudo apt autoremove'
alias clean='sudo apt autoremove && sudo apt autoclean'
alias fullupdate='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias x="exit"
# Dir navigation
alias ..='cd ..' 
alias ...='cd ../..' 
alias g.='cd ~/.config'
alias gd='cd ~/Downloads'
alias gc='cd ~/Code'
# System Info
alias myip="ip -f inet address | grep inet | grep -v 'lo$' | cut -d ' ' -f 6,13 && curl ifconfig.me && echo ' external ip'"
# EXA
alias l='exa -l --color=always --group-directories-first' # Compact long list, no header
alias ll='exa -l --color=always --group-directories-first --header --icons' # With headers and human-readable sizes
alias la='exa -la --color=always --group-directories-first --header --icons' # Includes hidden files, headers, icons
alias tree='exa --tree --level=2 --group-directories-first --color=always' # Directory tree view
alias lt='exa -la --sort=newest --group-directories-first --header' # Sorted by time
alias lst='exa -l --sort=newest --color=always' # Sort by modification time (descending)
alias lss='exa -l --sort=size --color=always --group-directories-first' # Sort by file size (descending)
# tmux
alias tn="tmux new-session -s"         # Create a new named tmux session: tn mysession
alias tl="tmux list-sessions"          # List all tmux sessions
alias td='tmux detach'                 # Detach from current tmux session
alias ta="tmux attach-session"         # Attach to the last used or only tmux session
alias tat="tmux attach-session -t"     # Attach to a specific named tmux session: tat mysession
alias tk="tmux kill-session"           # Kill the last used or only tmux session
alias tkt="tmux kill-session -t"       # Kill a specific named tmux session: tkt mysession
alias treload='tmux source-file ~/.config/tmux/tmux.conf'  # reload tmux config
alias monitor='~/.config/tmux/monitoring.sh' # Launch a tmux session with system monitoring (sensors + htop)
alias tcheats='bat --paging=always ~/.config/tmux/tmux-cheatsheet.md' # Show tmux cheatsheet

# Delete all saved tmux sessions after confirmation
forgettmux() {
  local dir="$HOME/.local/share/tmux/resurrect"

  if [[ ! -d "$dir" ]]; then
    echo "Resurrect session directory not found: $dir"
    return 1
  fi

  echo "Are you sure you want to delete all saved tmux sessions from:"
  echo "   $dir"
  read -r "confirm?Type y to continue: "
  if [[ "$confirm" == "y" ]]; then
    rm -f "$dir"/*
    echo "Tmux resurrect sessions cleared."
  else
    echo "Cancelled. No changes made."
  fi
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ---------------------
#  Powerlevel10k Config
# ---------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ---------------------
# Zoxide Initialization
eval "$(zoxide init zsh)"
