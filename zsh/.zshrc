# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mytheme"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	sudo
	z
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export LD_PRELOAD=""
export PATH="$HOME/bin:/usr/lib/ccache/bin/:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:$HOME/.dotnet/tools:$PATH"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ZSH history file
HISTSIZE=800
SAVEHIST=800
HISTFILE=~/.zsh_history

# Fancy auto-complete
autoload -Uz compinit
zstyle ':completion:*' menu select=0
zmodload zsh/complist
zstyle ':completion:*' format '>>> %d'
compinit
_comp_options+=(globdots) # hidden files are included

# Keybindings section
bindkey "^[k" autosuggest-execute                               # accept autosuggestion with alt+k
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

setxkbmap -layout us,cz -variant ,ucw -option grp:switch

# functions
cl() {
	cd "${1:-$HOME}" && ls --color
}
rl() {
	rm "$1" && ls --color
}
brt() {
	xrandr --output eDP --brightness $1
}
sa() {
	eval `ssh-agent`
	KEY=${1:-~/.ssh/gw_key}
	ssh-add $KEY
}
sz() {
	du -h --max-depth=1 "${1:-./}" | sort -rh | head -n 11
}

# alias
alias ip="ip -c"
alias path="echo $PATH | tr ':' '\n'"
alias zrc="nvim ~/.zshrc"
alias rs="redshift &"
alias btc="bluetoothctl"
alias down="nmcli device disconnect wlan0"
alias brb="i3lock -c 000000 && systemctl suspend"
alias :wq="exit"
alias mps="mplayer -nosound"
alias pip="python3 -m pip"
alias odump="objdump -d a.out"
alias keyboard="setxkbmap -layout us,cz -variant ,ucw -option grp:switch"
alias hx="helix"
alias tb="nohup thunderbird &> /dev/null &!"
alias viv="nohup vivaldi-stable &> /dev/null &!"
alias vivaldi="vivaldi-stable"
alias camera='qv4l2 &!'
alias prolog="swipl"
alias mountw="sudo mount -m /dev/nvme0n1p3 /mnt/Windows"
alias umountw="sudo umount /mnt/Windows"
alias mountd="sudo mount -m /dev/sda1 /mnt/D"
alias umountd="sudo umount /mnt/D"
alias ok="echo 'K.'"
alias c="clear"
alias cd..="cd .."
alias sl="ls --color=auto"
alias vi="vim"
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias df="df -h"
alias free="free -h"
alias du="du -h"
alias shred="shred -zf"

