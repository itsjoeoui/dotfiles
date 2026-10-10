# Core environment and Homebrew paths must be ready before plugin initialization.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export EDITOR="nvim"
export VISUAL="$EDITOR"
typeset -U PATH path

_dotfiles_brew_prefix="${HOMEBREW_PREFIX:-}"
if [[ -z "$_dotfiles_brew_prefix" ]]; then
  for _dotfiles_prefix in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew; do
    if [[ -x "$_dotfiles_prefix/bin/brew" ]]; then
      _dotfiles_brew_prefix="$_dotfiles_prefix"
      break
    fi
  done
fi
if [[ -n "$_dotfiles_brew_prefix" ]]; then
  path=("$_dotfiles_brew_prefix/bin" "$_dotfiles_brew_prefix/sbin" $path)
fi
path=("$HOME/.local/bin" $path)

# Oh My Zsh plugins and completion.
export ZSH="$HOME/.oh-my-zsh"
plugins=(git colored-man-pages)
(( $+commands[direnv] )) && plugins+=(direnv)
if [[ -o zle && -t 0 && -t 1 && -r "${ZSH_CUSTOM:-$ZSH/custom}/plugins/fzf-tab/fzf-tab.plugin.zsh" ]]; then
  plugins+=(fzf-tab)
fi
[[ -r "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# Command shortcuts.
alias j="z"
alias vim="nvim"
alias v="nvim"
alias vc="nvim ."
alias ta="tmux attach"
alias ls="lsd"
alias p="pnpm"
alias top="gotop -s"
alias bruh="brew update && brew upgrade && brew cleanup && brew autoremove"
alias k="kubectl"
alias y="yazi"
alias lg="lazygit"
alias mars="java -jar /Applications/Mars.jar"
alias -s go="$EDITOR"
alias -s json="$EDITOR"
alias -s yaml="$EDITOR"
alias -g NE='2>/dev/null'
alias -g JQ='| jq'
alias -g C='| pbcopy'
autoload -Uz zmv

# Language environments.
export GOPATH="$HOME/src/go"
path=("$GOPATH/bin" $path)
[[ -d "$_dotfiles_brew_prefix/opt/openjdk/bin" ]] && path=("$_dotfiles_brew_prefix/opt/openjdk/bin" $path)
[[ -d "$HOME/.jenv/bin" ]] && path=("$HOME/.jenv/bin" $path)
(( $+commands[jenv] )) && eval "$(jenv init -)"
(( $+commands[opam] )) && eval "$(opam env --shell=zsh 2>/dev/null)"

if [[ -d "$_dotfiles_brew_prefix/opt/ruby/bin" ]]; then
  path=("$_dotfiles_brew_prefix/opt/ruby/bin" $path)
  (( $+commands[gem] )) && path=("$(gem environment gemdir)/bin" $path)
fi

# Shopify's machine-local setup is optional and is not stored in this repository.
if [[ -d "$XDG_CONFIG_HOME/dev" ]]; then
  if [[ -r /opt/dev/sh/chruby/chruby.sh ]] && ! (( $+functions[chruby] )); then
    chruby() {
      source /opt/dev/sh/chruby/chruby.sh
      chruby "$@"
    }
  fi
  [[ -r /opt/dev/dev.sh ]] && source /opt/dev/dev.sh

  typeset -U _dotfiles_kubeconfigs
  _dotfiles_kubeconfigs=(${(s.:.)KUBECONFIG})
  for _dotfiles_kubeconfig in "$HOME/.kube/config" "$HOME/.kube/config.shopify.cloudplatform"; do
    [[ -f "$_dotfiles_kubeconfig" ]] && _dotfiles_kubeconfigs+=("$_dotfiles_kubeconfig")
  done
  (( ${#_dotfiles_kubeconfigs} )) && export KUBECONFIG="${(j.:.)_dotfiles_kubeconfigs}"
  for _dotfiles_workflow in "$HOME"/src/github.com/shopify/cloudplatform/workflow-utils/*.bash(N); do
    source "$_dotfiles_workflow"
  done
  (( $+functions[kubectl-short-aliases] || $+commands[kubectl-short-aliases] )) && kubectl-short-aliases

  [[ -x "$HOME/.local/state/tec/profiles/base/current/global/init" ]] && eval "$("$HOME/.local/state/tec/profiles/base/current/global/init" zsh)"
fi

# Optional integrations.
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"
(( $+commands[mise] )) && eval "$(mise activate zsh)"
(( $+commands[thefuck] )) && eval "$(thefuck --alias)"
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# TUNA mirrors are useful on this machine; override these externally if needed.
export HOMEBREW_API_DOMAIN="${HOMEBREW_API_DOMAIN:-https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api}"
export HOMEBREW_BOTTLE_DOMAIN="${HOMEBREW_BOTTLE_DOMAIN:-https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles}"
export HOMEBREW_BREW_GIT_REMOTE="${HOMEBREW_BREW_GIT_REMOTE:-https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git}"

# Widgets and prompt initialization require an interactive line editor.
if [[ -o zle && -t 0 && -t 1 && "$TERM" != dumb ]]; then
  [[ -r "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
  zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
  autoload -Uz edit-command-line
  zle -N edit-command-line
  bindkey '^x^e' edit-command-line
  bindkey ' ' magic-space
  (( $+commands[starship] )) && eval "$(starship init zsh)"
fi

# Load highlighting after integrations that add or change ZLE widgets.
if [[ -o zle && -t 0 && -t 1 ]]; then
[[ -r "$_dotfiles_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$_dotfiles_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -r "$_dotfiles_brew_prefix/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ]] && source "$_dotfiles_brew_prefix/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

fi

# Keep Bun ahead of other runtimes, as in the original configuration.
[[ -d "$HOME/.bun/bin" ]] && path=("$HOME/.bun/bin" $path)

# Reapply uniqueness after environment managers update PATH.
typeset -U PATH path
path=("${path[@]}")

unset _dotfiles_brew_prefix _dotfiles_prefix _dotfiles_kubeconfigs _dotfiles_kubeconfig _dotfiles_workflow
