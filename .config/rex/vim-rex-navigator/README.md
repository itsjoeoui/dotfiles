# vim-rex-navigator

Move between Neovim splits and [Rex](https://www.superlogical.com/rex) panes with the same keys:
`ctrl-h`, `ctrl-j`, `ctrl-k`, `ctrl-l`. The Rex equivalent of
[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator).

- In a pane running `nvim`, `vim`, `view` or `vimdiff`, Rex passes the key to the editor.
- The editor moves between its splits, and at its edge runs `rex focus <direction>`.
- In any other pane, Rex moves pane focus.

## Install

Rex has no plugin manager, but `init.lua` can `require` files stored beside it.

```sh
git clone https://github.com/paul-enz/vim-rex-navigator ~/.config/rex/vim-rex-navigator
```

```lua
-- ~/.config/rex/init.lua
do
  local ok, navigator = pcall(require, "vim-rex-navigator")
  if ok then navigator.setup() end
end
```

Reload with `rex config reload`.

Keep the `pcall`: Rex skips a bad `rex.*` call but stops loading `init.lua` at a Lua
error, so if the plugin is ever missing, an unguarded `require` would take every binding
after it with it. Guarded, only the navigator keys go.

Neovim (lazy.nvim):

```lua
{ "paul-enz/vim-rex-navigator" }
```

The Neovim half does nothing outside Rex (`$REX_SESSION` unset), so it can sit beside
vim-tmux-navigator. Inside Rex it maps the keys on `VimEnter`, so it overrides other
plugins' `ctrl-hjkl` mappings, including vim-tmux-navigator's. Set `$REX_BIN_PATH` if `rex` is not on Neovim's `PATH`.

### Share Neovim's managed copy with Rex

Instead of cloning the plugin into Rex's config directory, Rex can load the copy
installed by your Neovim plugin manager. This keeps both halves on the same version
and lets the plugin manager update them together.

For Neovim 0.12+ with `vim.pack`, add this to your Neovim config:

```lua
vim.pack.add({ "https://github.com/paul-enz/vim-rex-navigator" })
```

Start Neovim and let it install the plugin first. Then use this in Rex instead of
the `require` block above:

```lua
-- ~/.config/rex/init.lua
do
  local data_home = os.getenv("XDG_DATA_HOME") or os.getenv("HOME") .. "/.local/share"
  local path = data_home .. "/nvim/site/pack/core/opt/vim-rex-navigator/init.lua"
  local ok, navigator = pcall(dofile, path)
  if ok then navigator.setup() end
end
```

This path assumes Neovim's default app name and data directory on macOS or Linux.
For another plugin manager or a custom Neovim data directory, point `dofile` at the
plugin's root `init.lua` in that manager's installation directory.

Run `rex config reload` after configuring Rex and after updating the plugin. If the
Neovim-managed copy is removed, the guarded `dofile` loses only the navigator keys.

## Limitations

- Editor detection reads the pane's foreground process, so nvim over `ssh` or behind a
  pty wrapper such as `atuin pty-proxy` isn't detected; the key moves Rex focus instead.
- Requires Neovim 0.10+ (`vim.system`).
