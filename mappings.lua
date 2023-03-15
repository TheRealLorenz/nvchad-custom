---@type MappingsTable
local M = {}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  }
}

return M
