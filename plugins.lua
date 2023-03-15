---@type NvPluginSpec[]
local M = {
  {
    'stevearc/dressing.nvim',
    event = "UiEnter",
  },

  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function(_, opts)
          dofile(vim.g.base46_cache .. "mason")
          require("mason").setup(opts)
          vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
          end, {})
        end,
      },
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers(require("custom.lsp"))
    end,
  },
}

return M
