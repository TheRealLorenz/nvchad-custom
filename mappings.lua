---@type MappingsTable
local M = {}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  }
}

M.nvterm = {
  t = {
    ["<C-k>"] = { "<C-\\><C-n><C-w>k", "move up" },
    ["<C-j>"] = { "<C-\\><C-n><C-w>j", "move down" },
    ["<C-h>"] = { "<C-\\><C-n><C-w>h", "move left" },
    ["<C-l>"] = { "<C-\\><C-n><C-w>l", "move right" },
  }
}

return M
