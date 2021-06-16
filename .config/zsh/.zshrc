# Luke's config for the Zoomer Shell
# Modified as I need

# Use starship see https://starship.rs/ -----
# Uncomment below if you wonnt using it
if test "$USER" = "root"
then
	# Enable colors and change prompt:
	autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%m%{$fg[green]%}@ %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
else
	# starship prompt
	eval "$(starship init zsh)"
fi
# ---------------------------------- starship

# Default setting is set by this below line ----
# Enable colors and change prompt:
# autoload -U colors && colors	# Load colors

# # Adapted form Luke's, show like ([username@ ~]$)
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@ %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# ---------------------------------------- default

# After cd to git repository adds current branch, requires nerd fonts, if don't want delete to...
# gitcd() {
# 	\cd $1
# 	# PS1="%B%{$fg[white]%}%n@%M %{$fg[yellow]%}%~$(git status 2>/dev/null | sed 1q | sed "s/On\ branch/%{$fg[yellow]%}  /g") %{$reset_color%}$%b "
#   PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@ %{$fg[magenta]%}%~$(git status 2>/dev/null | sed 1q | sed "s/On\ branch/%{$fg[yellow]%} /g")%{$fg[red]%}]%{$reset_color%}$%b "
# }

# alias cd='gitcd'
# ...this line
# --------------------------------------- additional to default

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# # Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

#bindkey -s '^a' 'bc -lq\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

# bindkey '^[[P' delete-char


function z() { result=$(ls -t *pdf | awk '{print "" $0}' |rofi -dmenu -l 6 -p "Select PDF") 2>/dev/null && zathura "$result" }

# # Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

# Load fzf-tab
# See https://github.com/Aloxaf/fzf-tab/wiki/Configuration
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

    # disable sort when completing `git checkout`
    zstyle ':completion:*:git-checkout:*' sort false
    # set descriptions format to enable group support
    zstyle ':completion:*:descriptions' format '[%d]'
    # set list-colors to enable filename colorizing
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    # preview directory's content with exa when completing cd
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
    # switch group using `,` and `.`
    zstyle ':fzf-tab:*' switch-group ',' '.'

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

# Load archlinux plugin form OMZ; should be last.
source /usr/share/zsh/plugins/archlinux/archlinux.plugin.zsh 2>/dev/null

# Load git plugin form OMZ
source /usr/share/zsh/plugins/git/git.plugin.zsh 2>/dev/null

# Load zsh interactive cd with fzf
source /usr/share/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh 2>/dev/null

# Load git.io url shorter plugin
source /usr/share/zsh/plugins/gitio-zsh/gitio.plugin.zsh 2>/dev/null

# Load wakatime integration plugin
source /usr/share/zsh/plugins/zsh-wakatime/zsh-wakatime.plugin.zsh 2>/dev/null

# Load dotbare as dotfiles management
# source /usr/share/zsh/plugins/dotbare/dotbare.plugin.zsh 2>/dev/null

# # Load better zsh-vi-mode
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# function zvm_after_init() {
#     [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
#     [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# }

# Load ls colors with icon
# source $HOME/.local/share/lscolors

# fzf config
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
    --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
    --border'
 # export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# NNN config
source ~/.config/nnn/config.zsh 2>/dev/null
#
# jump integration
source ~/.config/zsh/jump.zsh 2>/dev/null
