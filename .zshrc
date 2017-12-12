# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
plugins=(git zsh-autosuggestions archlinux tmux zsh-syntax-highlighting z vi-mode)

local ZSH_CONF=$HOME/.oh-my-zsh/lib                  # Define the place I store all my zsh config stuff
local ZSH_CACHE=$ZSH_CONF/cache                # for storing files like history and zcompdump 

# Load external config files and tools
   source $ZSH_CONF/functions.zsh              # Load misc functions. Done in a seperate file to keep this from getting too long and ugly
   source $ZSH_CONF/spectrum.zsh               # Make nice colors available
   source $ZSH_CONF/termsupport.zsh            # Set terminal window title and other terminal-specific things

# Path to your oh-my-zsh installation.
export TERM="xterm-256color"
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
#on See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"


# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# make sure that if a program wants you to edit
# text, that Vim is going to be there for you
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

# ^ character negates the pattern ls -d ^*.c
setopt extendedglob

# Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# PowerLevel9k settings
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_MODE='awesome-fontconfig'
#POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_VCS_GIT_ICON='\ue60a'
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_RAM_ICON='\uf1c0'
POWERLEVEL9K_RAM_BACKGROUND="black"
POWERLEVEL9K_RAM_FOREGROUND="249"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n"
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{black} \uf17c %f%k%F{white}%f "
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{black} `date +%T` \UE12E %f%k%F{white}%f "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm rvm background_jobs ram battery vi_mode)
#POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT" #  String to display while in "Insert" mode. 
#POWERLEVEL9K_VI_COMMAND_MODE_STRING="NORMAL" #  String to display while in "Command" mode.

# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='green'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='236'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='yellow'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='236'
alias 'vim=vim'
alias 'vi=vim'
# 10ms for key sequences
KEYTIMEOUT=1

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
shasinstall () { /opt/shashlik/bin/shashlik-install $* }
shasrun () { /opt/shashlik/bin/shashlik-run $1 $2 }
