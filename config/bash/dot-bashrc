#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '



# Define common aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias screenshot='grim -g "$(slurp)" - | swappy -f -'

# Environment variables
TERM=xterm-256color

# Wayland support
if [ $XDG_SESSION_TYPE == "wayland" ]; then
	export MOZ_DBUS_REMOTE=1
	export MOZ_ENABLE_WAYLAND=1
fi
