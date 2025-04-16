# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
bindkey '^R' history-incremental-search-backward

# own:
setopt nohup

PS1='%m:%1~ %# '

alias vi="nvim"
alias shut="shutdown now"
alias shit="shutdown now"
alias cop="wl-copy"
alias past="wl-paste"
alias ls="ls --color" 
alias ff="firefox"
alias com="g++ -std=c++20 -g -Wall -fsanitize=address"
# alias scrot='grim -g "$(slurp)" - | wl-copy'
alias scrot='grim -g "$(slurp)" ss.png'
alias vinc="pactl set-sink-volume 0 +3%"
alias vdec="pactl set-sink-volume 0 -3%"

# Set second monitor to the left/right
alias monitor_left="wlr-randr --output HDMI-A-1 --pos -1920,0"
alias monitor_right="wlr-randr --output HDMI-A-1 --pos 1920,0"
alias monitor_mirror="wl-mirror --fullscreen-output HDMI-A-1 eDP-1 &"

# alias to manage dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# make postman work on wayland: https://github.com/postmanlabs/postman-app-support/issues/9746
alias postman="~/Postman/Postman --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"

export PATH="$HOME/bin:$PATH"

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mojolake/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
