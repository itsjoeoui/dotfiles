# Login-shell environment. Support Apple Silicon, Intel macOS, and Linuxbrew.
for _dotfiles_prefix in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew; do
  if [[ -x "$_dotfiles_prefix/bin/brew" ]]; then
    eval "$("$_dotfiles_prefix/bin/brew" shellenv)"
    break
  fi
done
unset _dotfiles_prefix

typeset -U PATH path
path=("$HOME/.local/bin" $path)

# Preserve older pipx entry points on machines that still have them.
if [[ -d "$HOME/Library/Python/3.11/bin" ]]; then
  path+=("$HOME/Library/Python/3.11/bin")
fi

# OrbStack is optional and remains machine-local.
if [[ -r "$HOME/.orbstack/shell/init.zsh" ]]; then
  source "$HOME/.orbstack/shell/init.zsh"
fi
