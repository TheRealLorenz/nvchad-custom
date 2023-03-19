---@type NvPluginSpec[]
local M = {
  {
    "stevearc/dressing.nvim",
    event = "UiEnter",
  },

  {
    "kylechui/nvim-surround",
    -- TODO: better event
    event = "VeryLazy",
    config = true,
  },

  {
    "christoomey/vim-tmux-navigator",
    -- TODO: better event
    event = "VeryLazy",
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
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers(require "custom.lsp")
      require("mason-null-ls").setup {
        automatic_setup = true,
      }
      require("null-ls").setup()
      require("mason-null-ls").setup_handlers()
    end,
  },
}

return M
