if vim.g.loaded_rex_navigator or not vim.env.REX_SESSION or vim.env.REX_SESSION == "" then
  return
end
vim.g.loaded_rex_navigator = true

local function navigate(wincmd, direction)
  local win = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd)
  if vim.api.nvim_get_current_win() == win then
    vim.system({ vim.env.REX_BIN_PATH or "rex", "focus", direction, "-s", vim.env.REX_SESSION })
  end
end

-- Mapped on VimEnter so these win over vim-tmux-navigator and other plugins' defaults.
local function map()
  for lhs, nav in pairs({ ["<C-h>"] = { "h", "left" }, ["<C-j>"] = { "j", "down" }, ["<C-k>"] = { "k", "up" }, ["<C-l>"] = { "l", "right" } }) do
    vim.keymap.set("n", lhs, function()
      navigate(nav[1], nav[2])
    end, { silent = true, desc = "Navigate " .. nav[2] .. " (Neovim/Rex)" })
  end
end

if vim.v.vim_did_enter == 1 then
  map()
else
  vim.api.nvim_create_autocmd("VimEnter", { once = true, callback = map })
end
