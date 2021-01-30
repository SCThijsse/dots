#!/usr/bin/env sh
#
# ~/.profile
#

# shellcheck source=/dev/null

# General environment variables
export EDITOR=nvim
export LC_TYPE=UTF-8
# export TERM=st
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# XDG support for various applications
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ATOM_HOME="$XDG_CONFIG_HOME/atom"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GEM_HOME="$XDG_CONFIG_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_CONFIG_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export HISTFILE="$XDG_DATA_HOME/bash/history"
export IDEA_PROPERTIES="$XDG_CONFIG_HOME/intellij-idea/idea.properties"
export IDEA_WM_OPTIONS="$XDG_CONFIG_HOME/intellij-idea/idea.vmoptions"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESSHISTFILE="$XDG_CACHE_HOME/lesshst"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_CONFIG_HOME/pass"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java""

# Set clipboard variable based on wayland
if [ -n "$WAYLAND_DISPLAY" ]; then
    export CLIPBOARD=wl-copy
else
    export CLIPBOARD=xclip
fi

# nnn config
export NNN_BMS="D:~/Documents;d:~/Downloads;E:/etc/;i:~/IdeaProjects;h:~/;m:/mnt;p:~/Pictures;S:~/Software;c:~/.config;s:~/.local/scripts"
export NNN_PLUG="d:dps;i:mnf;m:nmt;s:sxv"
export NNN_TMPFILE="$XDG_CONFIG_HOME/nnn/.lastd"
export NNN_OPENER="gio open"
export NNN_COPIER="$CLIPBOARD"
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

# Other environment variables
export _JAVA_AWT_WM_NONREPARENTING=1

# Add Android SDK platform tools to path
[ -d "$HOME/Software/platform-tools" ] && \
    PATH="$PATH:$HOME/Software/platform-tools"

# Add fzf to path
[ -d "$HOME/.local/share/fzf/bin" ] && PATH="$PATH:$HOME/.local/share/fzf/bin"

# Add ruby gems to path
[ -d "$XDG_CONFIG_HOME/gem/ruby/bin" ] && \
    PATH="$PATH:$XDG_CONFIG_HOME/gem/ruby/bin"

# Add bin & scripts to path
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"
[ -d "$HOME/.local/scripts" ] && PATH="$PATH:$HOME/.local/scripts"

# Added travis gem
[ -f "$HOME/.travis/travis.sh" ] && . "$HOME/.travis/travis.sh"

# Export secrets
[ -s "$HOME/.local/scripts/scr" ] && . "$HOME/.local/scripts/scr"

# Set if is dekstop or laptop based if machine has wifi
if [ "$(lspci -k | grep -ic wireless)" -gt 0 ]; then
    export TOP_TYPE="laptop"
else
    export TOP_TYPE="desktop"
fi

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec startx "$XDG_CONFIG_HOME/X11/xinitrc" dwm
elif [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty2" ]; then
    exec startx "$XDG_CONFIG_HOME/X11/xinitrc" sowm
elif [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty3" ]; then
    XKB_DEFAULT_LAYOUT=us exec sway
fi

# If running bash include the ~/.bashrc file
printf '%s' "$0" | grep "bash$" >/dev/null && \
    [ -f "$XDG_CONFIG_HOME/bashrc" ] && . "$XDG_CONFIG_HOME/bashrc"
