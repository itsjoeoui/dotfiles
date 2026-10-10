-- Seamless navigation between neovim and tmux panes
-- Depends on the tmux plugin 'christoomey/vim-tmux-navigator'
return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { mode = "n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { mode = "n", "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
    { mode = "n", "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
    { mode = "n", "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
    { mode = "n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    { mode = "t", "<c-h>", "<C-\\><C-n><cmd>TmuxNavigateLeft<cr>" },
    { mode = "t", "<c-j>", "<C-\\><C-n><cmd>TmuxNavigateDown<cr>" },
    { mode = "t", "<c-k>", "<C-\\><C-n><cmd>TmuxNavigateUp<cr>" },
    { mode = "t", "<c-l>", "<C-\\><C-n><cmd>TmuxNavigateRight<cr>" },
    { mode = "t", "<c-\\>", "<C-\\><C-n><cmd>TmuxNavigatePrevious<cr>" },
  },
  init = function()
    -- Disable default mappings to make it work in terminal mode
    vim.g.tmux_navigator_no_mappings = 1
  end,
}
