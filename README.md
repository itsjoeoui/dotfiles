# dotfiles

Personal configuration for Neovim/LazyVim, tmux, Zsh, Ghostty, Git, LazyGit, and Karabiner on macOS. GNU Stow links these files into the home directory.

## Setup

Clone this repository to `~/dotfiles`, then review the Brewfile before installing its applications and tools:

```sh
cd ~/dotfiles
brew bundle install --file=Brewfile
stow --simulate --verbose --target="$HOME" .
stow --target="$HOME" .
```

Keep machine-specific secrets and work configuration outside this repository. Karabiner's automatic backups and Homebrew lockfiles are ignored by Git.

Zsh uses Oh My Zsh with `git`, `colored-man-pages`, optional `direnv`, and the optional [fzf-tab plugin](https://github.com/Aloxaf/fzf-tab). Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) into `~/.oh-my-zsh` and fzf-tab into `~/.oh-my-zsh/custom/plugins/fzf-tab` to enable those integrations. The shell still starts when optional tools are absent.

For tmux plugins, install [TPM](https://github.com/tmux-plugins/tpm) into `~/.tmux/plugins/tpm`, then press `Ctrl+a`, followed by `I`, inside tmux. `Ctrl+a`, followed by `U`, checks plugin updates. The prefix is `Ctrl+a`; pane navigation uses `Ctrl+h/j/k/l`.

Neovim installs its plugins on first launch. Use `:Lazy` to manage plugins and `:Mason` for language tools. Python uses Ruff for linting/import cleanup/formatting and Astral's ty for type checking. TypeScript uses vtsls. The SQL terminal is on `<leader>D`; `<leader>cl` opens LSP information.

## Checks and reloads

```sh
zsh -n .zshrc
git diff --check
stow --simulate --verbose --target="$HOME" .
brew bundle check --file=Brewfile
```

Inside Neovim, run `:LazyHealth` and `:checkhealth nvim-treesitter`. Ghostty can validate its config with `/Applications/Ghostty.app/Contents/MacOS/ghostty +validate-config`.

Open a new terminal after changing `.zshrc`. Reload tmux configuration with `tmux source-file ~/.tmux.conf`. Ghostty's reload shortcut is `Cmd+Shift+,` on macOS. Karabiner detects configuration changes automatically.

## Machine-local setup

Zsh loads Shopify hooks only when `~/.config/dev` exists and the relevant scripts are installed. Work Kubernetes configuration paths are added once, and missing workflow scripts are skipped.

TUNA Homebrew mirrors remain the default for this machine. The mirror environment variables respect values exported before shell startup. Override `HOMEBREW_API_DOMAIN`, `HOMEBREW_BOTTLE_DOMAIN`, and `HOMEBREW_BREW_GIT_REMOTE` when using another mirror or upstream Homebrew.

The Brewfile describes this setup; it is not a complete inventory of every package currently installed on the machine. `brew bundle check` reports missing or outdated entries but does not install or remove applications.
