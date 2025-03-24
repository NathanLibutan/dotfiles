# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#
#
#program alias 
alias bambu='cd ~/Downloads/ && ./Bambu_Studio_linux_ubuntu_24.04_v01.09.03.50.AppImage' #alias program to start up the bambu labs appimage
alias pennsim='cd ~/109pencode && java -jar PennSim.jar' #alias for pennsim ECE109
alias pens='cd ~/109pencode && java -jar PennSim.jar' #alias for pennsim ECE109
alias signal='flatpak run org.signal.Signal'
#binding for opneing up the modules sadge
#alias do='docker start module_7 && docker exec -it module_7 /bin/bash'
#alias ds='docker stop module_7'
#can't do these key binds or alias as it will throw an error due to the way that bash completion works

#alias osu='flatpak run sh.ppy.osu' #osu mapping
#alias ls="sl" #shouldn't work but troll toggle
#

#alias for dotfiles

#opening and closing docker for FRC900 OLD
#alias dwso='docker start 2023_robot && docker exec -it 2023_robot /bin/bash'
#alias dwss='docker stop 2023_robot'
#ws=  workshop, d, o docker open, docker stop

#pwd docker things??? also for opening and clsoing docker for FRC900
#alias dpwdo='docker start competent_margulis && docker exec -it competent_margulis /bin/bash'
#alias dpwds='docker stop competent_margulis'
#pwd = pwd command parameter, o docker open, docker stop

#resolution bindings
#unsure of why, but when switching dedicated graphics modes, edp display values chamges, well i guess that makes sense
#but im unsure of how to switch properly when it does all, so just hardcode for all the possible ones
alias setm='xrandr --output eDP-1 --mode 2560x1600'
alias setmm='xrandr --output eDP-1-1 --mode 2560x1600'
#resolution max binding for either integrated or dedicated gpu modes
alias setl='xrandr --output eDP-1 --mode 1920x1200'
alias setll='xrandr --output eDP-1-1 --mode 1920x1200'
#resolution low binding for either integrated or dedicated gpu modes
alias seto='xrandr --output eDP-1 --mode 1920x1440'
alias seto='xrandr --output eDP-1-1 --mode 1920x1440'
#stretched resolution for either integrated or dedicated gpu modes

#connecting and disconnecting vpn
#smart location in NC is GA -Atlanta
#vpnp is for vpn usage with respected to restricted states
alias vpnp='expressvpn connect usse' #connects to seattle WA
alias vpnc='expressvpn connect smart' #connects to nearest server smart, default is GA atlanta
alias vpndc='expressvpn disconnect' #disconnects from the vpn server being used
alias vpnstat='expressvpn status' #pull up current express vpn status

#check battery stats
alias check_bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

#alias for vim (i'm not typing allat)
alias v='vim'

#alias for checking ping
alias checkp='ping google.com'
#

#alias for venv environments
alias venv='source venv/bin/activate'



shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#sgiles case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;
#*)
#    ;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
. "$HOME/.cargo/env"
export PATH=/home/ubuntu/.local/bin:/home/ubuntu/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin



