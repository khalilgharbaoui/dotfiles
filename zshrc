export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Add wisely, as too many plugins slow down shell startup.
plugins=(rails git ruby nyan brew bundler rbenv npm gem github python node docker sudo web-search colored-man-pages history-substring-search zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting)


 POWERLEVEL9K_MODE='awesome-patched'
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="gitster"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n"
# POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_DELIMITER="..."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_left"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_IP_INTERFACE="en0"
POWERLEVEL9K_IP_BACKGROUND='250'

#node_version

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv aws nvm docker_machine rspec_stats vi_mode ip battery spotify)
POWERLEVEL9K_NVM_BACKGROUND='28'
POWERLEVEL9K_NVM_FOREGROUND='15'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868 %d.%m.%y}"
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status zsh_showStatus battery custom_wifi_signal time)
# POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="blue"
# POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="yellow"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="\U2570\U2500 > "
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{250}%F{black} %D{\uE868 %d.%m} \uE12E %D{%T} %f%k%F{250}%f "
# http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
POWERLEVEL9K_DIR_HOME_BACKGROUND="27"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="033"
POWERLEVEL9K_DIR_HOME_FOREGROUND="15"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="15"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="15"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='121'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='gray'

POWERLEVEL9K_SPOTIFY_BACKGROUND="green"
POWERLEVEL9K_SPOTIFY_FOREGROUND="black"
#status
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

# Advanced `vcs` color customization
# POWERLEVEL9K_VCS_GIT_ICON='\uf113 '
# enable the vcs segment in general
POWERLEVEL9K_SHOW_CHANGESET=true
# just show the 6 first characters of changeset
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_VCS_SHOW_SUBMODULE_DIRTY=true
POWERLEVEL9K_VCS_HIDE_TAGS=false
# POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
# POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='010'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='011'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='000'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='214'
#rbenv
POWERLEVEL9K_RBENV_FOREGROUND='15'
POWERLEVEL9K_RBENV_BACKGROUND='1'

POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="NORMAL"

# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='005'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='236'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='245'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='236'
ZSH_THEME="powerlevel9k/powerlevel9k"


 # terminal to support 256 color schemes
export TERM="xterm-256color"

# sanity check on 'rm *'
setopt RM_STAR_WAIT
# allows Bash tyle comments on command line
setopt interactivecomments
# Zsh has a spelling corrector, for wizards with a
# penchant for typos
setopt CORRECT

unset MAILCHECK

# Highlighted man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# History search
hgrep () {
    history | egrep --color=auto --recursive "$@" | egrep --color=auto --recursive -v "hgrep $@"
}

prompt_spotify () {
  state=`osascript -e 'tell application "Spotify" to player state as string'`;
  if [ $state = "playing" ]; then
    artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
    track=`osascript -e 'tell application "Spotify" to name of current track as string'`;

    echo -n "$artist - $track 🎧 ";
  fi
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/khalilgharbaoui/.oh-my-zsh

export RBENV_ROOT=/Users/khalilgharbaoui/.rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi



# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/khalilgharbaoui/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'


export BUNDLER_EDITOR="atom"


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

alias buby='bundle exec ruby'
alias brake='bundle exec rake'
alias bapistrano='bundle exec cap'
alias brackup='bundle exec rackup'
alias breakup='bundle exec rackup'
alias brails='bundle exec rails'
alias botgun='bundle exec shotgun --port 9292'
alias boreman='bundle exec foreman start'
alias brunicorn='bundle exec unicorn --port 9292'
alias bunny='bundle install --jobs 16 | lolcat' # how Dutch
alias bspec='bundle exec rspec'
alias inspec='bundle exec rspec --tag ~interactive'
alias bidekiq='bundle exec sidekiq'
alias bap='bundle exec cap'
alias spoty='spotify'
alias play='spoty play'
alias seemails='open http://www.lvh.me:3000/emails'
alias fixmysql='brew services restart mysql'
alias gitlogs="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# generated a password usage:
# password 50
# => CG2z6XW4XcLf87wLSKhZtQW2hwkBPvgdQlcklRh97WNnWw7xnc
#(pipe it to |pbpaste; to past it... but that would make it visable)
password() { pwgen -Bsv $1 1 |pbcopy; echo “The $1 character capitalized alphanumeric password has been generated and copied to you clipboard”
}

# added by travis gem
[ -f /Users/khalilgharbaoui/.travis/travis.sh ] && source /Users/khalilgharbaoui/.travis/travis.sh
