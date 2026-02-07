# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# intration of starship
eval "$(starship init zsh)"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# my aliases
alias i3c="nvim ~/.config/i3/config"
alias alc="nano ~/.config/alacritty/alacritty.toml"
alias tms="sudo GDK_SCALE=2 timeshift-gtk"
export PATH=$PATH:/opt/freefilesync
alias cls=clear
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
export PATH="$HOME/.local/bin:$PATH"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

mkcd(){
  dir=$1
  mkdir -p "$dir"
  cd "$dir"
}

alias get_user='awk -F: "\$3 >= 1000 && \$3 < 65000 {print \$1}" /etc/passwd'
alias home="cd ~"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias st=startx
alias kvim="NVIM_APPNAME=nvim-kickstart nvim"
alias lvim="NVIM_APPNAME=nvim-lazy nvim"
setopt extended_glob

# In .zshrc (kein alias!):
md2pdf() {
  local in_file_name=${1%.md}
  local out_file_name="${in_file_name}.pdf"

  pandoc "$1" \
  --pdf-engine=xelatex \
  -V mainfont="DejaVu Serif" \
  -V geometry=margin=2cm \
  -V tables=true \
  -o "$out_file_name" 
}

html2pdf() {
  local in_file_name=${1%.html}
  local out_file_name="${in_file_name}.pdf"
  brave --headless --print-to-pdf="${out_file_name}" "$1" 
}
alias swap="setxkbmap -option caps:swapescape"
eval "$(direnv hook zsh)"
alias vim="nvim"
alias kb="setxkbmap -layout us,ch -variant ",de" -option grp:win_space_toggle"
export PATH="$HOME/.cargo/bin:$PATH"
alias wln="nmcli device wifi list"

# Funktion für neues direnv-Projekt
newvenv() {
  python -m venv .venv
  source .venv/bin/activate
  cp ~/Templates/.envrc_template .envrc
  direnv allow
}

# timer
timer() {
  sleep "$1"
  paplay /home/david/iphone_alarm.mp3 &
  notify-send "Timer" "Fertig: $1"
}

