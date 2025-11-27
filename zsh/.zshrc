# =================================
# 1. BASIC SHELL OPTIONS (FIRST!)
# =================================
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

# =================================
# 2. INITIALIZE COMPLETION SYSTEM
# =================================
autoload -Uz compinit
compinit

# =================================
# 3. ENV
# =================================
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:$HOME/.cargo/bin"
export EDITOR=kak
export VISUAL=kak

# =================================
# 4. LOAD PLUGINS
# =================================
eval "$(sheldon source)"
eval "$(zoxide init zsh)"

# =================================
# 5. FZF-TAB CONFIGURATION (AFTER plugins loaded)
# =================================
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-flags --height=30% --preview-window=right:65%
zstyle ':fzf-tab:complete:git*' fzf-preview 'git log --oneline -n 10'

# =================================
# 6. STARSHIP PROMPT
# =================================
eval "$(starship init zsh)"

# =================================
# 7. POSTINIT
# =================================
#wal -R >> /dev/null
#fastfetch
hyfetch
dysk

# =================================
# 8. BINDS
# =================================
bindkey '^[[A' fzf-history-widget

# =================================
# 9. ALIASES & FUNCTIONS
# =================================

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

