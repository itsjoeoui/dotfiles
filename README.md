# dotfiles

Personal configuration for Neovim/LazyVim, tmux, Zsh/Oh My Zsh, Ghostty, Rex, Git, GitHub CLI, LazyGit, npm, Mise, and Karabiner on macOS. GNU Stow links these files into the home directory.

## Setup

Clone this repository to `~/dotfiles`, then review the Brewfile before installing its applications and tools:

```sh
cd ~/dotfiles
brew bundle install --file=Brewfile
stow --simulate --verbose --target="$HOME" .
stow --target="$HOME" .
mise install
```

Keep machine-specific secrets and work configuration outside this repository. Karabiner's automatic backups and Homebrew lockfiles are ignored by Git.

Zsh uses Oh My Zsh's `robbyrussell` prompt with `git`, `colored-man-pages`, optional `direnv`, and the optional [fzf-tab plugin](https://github.com/Aloxaf/fzf-tab). Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) into `~/.oh-my-zsh` and fzf-tab into `~/.oh-my-zsh/custom/plugins/fzf-tab` to enable those integrations. The shell still starts when optional tools are absent. The `thefuck` integration remains enabled when installed; Starship and Yazi hooks are not used.

`.zshenv` loads Cargo only when installed. `.zprofile` discovers Homebrew on Apple Silicon, Intel macOS, or Linuxbrew, and loads OrbStack only when its local integration exists. No username-specific paths are needed.

For tmux plugins, install [TPM](https://github.com/tmux-plugins/tpm) into `~/.tmux/plugins/tpm`, then press `Ctrl+a`, followed by `I`, inside tmux. `Ctrl+a`, followed by `U`, checks plugin updates. The prefix is `Ctrl+a`; pane navigation uses `Ctrl+h/j/k/l`.

Neovim installs its plugins on first launch. Use `:Lazy` to manage plugins and `:Mason` for language tools. Python uses Ruff for linting/import cleanup/formatting and Astral's ty for type checking. TypeScript uses vtsls. The SQL terminal is on `<leader>D`; `<leader>cl` opens LSP information.

## Runtime versions

Mise is the default version manager for Node, Python, Ruby, Go, pnpm, Bun, uv and Just. Global defaults are tracked in `.config/mise/config.toml`; project `mise.toml`, `.tool-versions` and supported language version files override them. Run `mise install` after cloning or changing versions, and `mise use <tool>@<version>` inside a project to select its version. Homebrew manages shell utilities and applications. Existing Homebrew runtimes can remain installed as fallbacks or dependencies.

Java tooling is no longer enabled by default. The conditional work `chruby` hook remains for scripts that explicitly require that command; mise does not impersonate other version-manager commands. Opam remains responsible for OCaml switches. `bruh` retains its existing Homebrew update/upgrade/cleanup behavior; update mise-managed defaults explicitly with `mise use --global <tool>@<version>` and commit the resulting config.

## Checks and reloads

```sh
dotfiles-check
dotfiles-check --packages
```

The default checks validate Zsh/Ruby/Lua syntax, Git whitespace, all tracked JSON/TOML/YAML files, Stow conflicts, runtime availability and the repository's Ghostty configuration. Lua files are compiled without executing configuration or loading plugins. `--packages` also checks the Brewfile for missing or outdated packages. Checks do not install packages or reload running applications. Before opening a new shell, run `python3 .local/bin/dotfiles-check` from this repository.

Inside Neovim, run `:LazyHealth` and `:checkhealth nvim-treesitter`. Ghostty can validate its config with `/Applications/Ghostty.app/Contents/MacOS/ghostty +validate-config`.

Open a new terminal after changing `.zshrc`. Reload tmux configuration with `tmux source-file ~/.tmux.conf`. Ghostty's reload shortcut is `Cmd+Shift+,` on macOS. Karabiner detects configuration changes automatically.

## Rex

Rex configuration lives in `.config/rex/init.lua`, linked by Stow to `~/.config/rex/init.lua`. It includes Ctrl+A tab/pane shortcuts, Ctrl+Alt+H/J/K/L pane resizing, and Ctrl+H/J/K/L navigation between Neovim and Rex panes.

The Rex-side navigation helper is vendored in `.config/rex/vim-rex-navigator/` from [paul-enz/vim-rex-navigator](https://github.com/paul-enz/vim-rex-navigator), with its license retained. Neovim installs its matching plugin through Lazy in `.config/nvim/lua/plugins/rex.lua`. Rex application state and session data stay outside this repository.

## Pi

Pi preferences live in `.pi/agent/settings.json`, linked by Stow to `~/.pi/agent/settings.json`. Hardware cursor support is enabled with `"showHardwareCursor": true`, so plain `pi` works without `PI_HARDWARE_CURSOR=1`. Restart Pi after changing this cursor preference.

Only configuration belongs in the repository; Pi credentials (`auth.json`), the model cache (`models-store.json`), and session history remain machine-local and are ignored by Git.

## Preferences versus machine-local state

Git's portable editor, diff, merge, and workflow preferences live in `.config/git/config`. Keep identity, SSH signing keys, 1Password signing paths, and credential helpers in a machine-local `~/.gitconfig`; if that file exists, retain its include of `~/.config/git/config`.

GitHub CLI preferences live in `.config/gh/config.yml`; `hosts.yml` and credentials are not tracked. Authenticate separately on each device with `gh auth login`.

`.npmrc` tracks the Buf scope and npm mirror preferences. Do not add authentication tokens to this shared file; use environment-based authentication or an untracked project-local config instead.

Neovim is the only editor configured here; Ghostty and Rex are the supported terminals. Legacy editor/terminal, Fish, Powerlevel10k, Atuin, Yazi, GitUI, spotify-player, and LinearMouse preferences are not synced. Removing their configs does not uninstall the applications or delete their history. Cleanup backups remain outside this repository under `~/.local/state/dotfiles-backups/`.

## Machine-local setup

Zsh loads Shopify hooks only when `~/.config/dev` exists and the relevant scripts are installed. Work Kubernetes configuration paths are added once, and missing workflow scripts are skipped.

TUNA Homebrew mirrors remain the default for this machine. The mirror environment variables respect values exported before shell startup. Override `HOMEBREW_API_DOMAIN`, `HOMEBREW_BOTTLE_DOMAIN`, and `HOMEBREW_BREW_GIT_REMOTE` when using another mirror or upstream Homebrew.

The Brewfile describes this setup; it is not a complete inventory of every package currently installed on the machine. `brew bundle check` reports missing or outdated entries but does not install or remove applications.
