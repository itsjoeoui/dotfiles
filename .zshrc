# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="spaceship-prompt/spaceship"

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
plugins=(
    git
    colored-man-pages
    direnv
    fzf-tab
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias j="z" # I am more used to the j for autojump
alias vim="nvim"
alias v="nvim"
alias vc="nvim ."
alias ta="tmux attach"
alias ls="lsd"
alias p="pnpm"
alias top="gotop -s"
alias ta="tmux attach"
alias bruh="brew update && brew upgrade && brew cleanup && brew autoremove"
alias k="kubectl"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"

# Golang
export GOPATH="$HOME/Workspace/go"
export PATH="$HOME/Workspace/go/bin:$PATH"

# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
if type "jenv" > /dev/null; then
  eval "$(jenv init -)"
fi

# Ocaml
if type "opam" > /dev/null; then
  eval $(opam config env)
fi

# McGill
# alias jetuml="jenv shell temurin64-17.0.5 && j 303 && java --module-path javafx-sdk-19/lib --add-modules=javafx.controls,javafx.swing,java.desktop,java.prefs -jar JetUML-3.5.jar"
alias mars="java -jar /Applications/Mars.jar"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Node.js
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Haskell
# export PATH="$PATH:$HOME/.ghcup/bin/"

# alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
# alias nvim-kick="NVIM_APPNAME=kickstart nvim"
# alias nvim-chad="NVIM_APPNAME=NvChad nvim"
# alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
#
# function nvims() {
#   items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
#   config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
#   if [[ -z $config ]]; then
#     echo "Nothing selected"
#     return 0
#   elif [[ $config == "default" ]]; then
#     config=""
#   fi
#   NVIM_APPNAME=$config nvim $@
# }

# Ruby
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# ZSH
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# source $(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.zsh
eval "$(starship init zsh)"

# Wealthsimple
# if [ -d "$HOME/.config/wealthsimple/" ]; then
#   source /Users/joey.yu/.config/wealthsimple/env.secrets
#   source /Users/joey.yu/.config/wealthsimple/rbenv/config.zsh
#   source /Users/joey.yu/.config/wealthsimple/direnv/config.zsh
#   source /Users/joey.yu/.config/wealthsimple/nvm/config.zsh
#   eval "$(ws hook zsh)"
#
#   # Android
#   export ANDROID_HOME=$HOME/Library/Android/sdk
#   export PATH=$PATH:$ANDROID_HOME/emulator
#   export PATH=$PATH:$ANDROID_HOME/tools
#   export PATH=$PATH:$ANDROID_HOME/tools/bin
#   export PATH=$PATH:$ANDROID_HOME/platform-tools
# fi

# Created by `pipx` on 2024-09-03 19:06:29
export PATH="$PATH:$HOME/.local/bin"

if [ $(hostname) = "JoeysShopifyMBP" ] || [ $(hostname) = "Joeys-Shopify-MacBook-Pro.local" ]; then
  [[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

  [[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

  [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

  # cloudplatform: add Shopify clusters to your local kubernetes config
  export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/itsjoeoui/.kube/config:/Users/itsjoeoui/.kube/config.shopify.cloudplatform
  for file in /Users/itsjoeoui/src/github.com/shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
  kubectl-short-aliases

  # Added by tec agent
  [[ -x /Users/itsjoeoui/.local/state/tec/profiles/base/current/global/init ]] && eval "$(/Users/itsjoeoui/.local/state/tec/profiles/base/current/global/init zsh)"
fi


zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

