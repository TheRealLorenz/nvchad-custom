local core_lsp = require "plugins.configs.lspconfig"

local function get_custom_settings(server_name)
  local ok, settings = pcall(require, "custom.lsp.servers." .. server_name)
  if ok then
    return settings
  else
    return {}
  end
end

local lsp_settings = {
  function(server_name)
    local settings = get_custom_settings(server_name)

    require("lspconfig")[server_name].setup {
      on_attach = core_lsp.on_attach,
      settings = settings,
      capabilities = core_lsp.capabilities,
    }
  end,
}

return lsp_settings
