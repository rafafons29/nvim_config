------ Functions to activate server to filetype un current buffer ------------

-- Function to activate a server
local function active_lsp(server_name)
  local servers = vim.lsp.get_clients()
  for _, server in pairs(servers) do
    if server.name == server_name then
      -- Cuando este activo no se volvera a activar
      return
    end
  end
  -- Se activa el servidor si este no lo esta.
  -- vim.lsp.start_client(server_name)
  vim.cmd("LspStart " .. server_name)
end

local function setup_server(server_name, config)
  local setup, nvim_lsp = pcall(require, "lspconfig")
  if not setup then return end
  nvim_lsp[server_name].setup(config)
end

-- ----------------Conf to servers lsp---------------- --
local lspf = require("servers.lsp_functions")
return {
  -- Lua
  lua = function()
    local lsp_lua = require("servers.lsp_lua")()
    setup_server('lua_ls', {
      on_attach = function(client, bufnr)
        lspf.on_attach(client, bufnr)
        lspf.enable_format_on_save(client, bufnr)
      end,
      settings = lsp_lua.settings,
    })
    active_lsp("lua_ls")
  end,

  -- Goland config
  go = function()
    local lsp_go = require("servers.lsp_go")
    setup_server('gopls', {
      on_attach = lspf.on_attach,
      capabilities = lspf.capabilities,
      cmd = lsp_go.cmd,
      filetypes = lsp_go.filetypes,
      root_dir = lsp_go.root_dir,
      settings = lsp_go.settings
    })
    active_lsp('gopls')
  end,

  -- Python server lsp
  py = function()
    local lsp_py = require("servers.lsp_pyright")
    setup_server('pyright', {
      on_attach = lspf.on_attach,
      capabilities = lspf.capabilities,
      settings = lsp_py.settings,
    })
    active_lsp('pyright')
  end,

  -- C/C++ server lsp
  clangd = function()
    local lsp_c = require("servers.lsp_clangd")
    setup_server('clangd', {
      on_attach = lspf.on_attach,
      capabilities = lspf.capabilities,
      cmd = lsp_c.cmd,
    })
    active_lsp('clangd')
  end,

  -- Cmake Language Server
  cmake = function()
    local lsp_cmk = require("servers.lsp_cmake")
    setup_server('cmake', {
      on_attach = lspf.on_attach,
      capabilities = lspf.capabilities,
      cmd = lsp_cmk.cmd,
      filetypes = lsp_cmk.filetypes,
    })
    active_lsp('cmake')
  end,

  -- Typescript and javascript
  tss = function()
    local lsp_tss = require("servers.lsp_tsserver")
    setup_server('tsserver', {
      on_attach = lspf.on_attach,
      capabilities = lspf.capabilities,
      filetypes = lsp_tss.filetypes,
      cmd = lsp_tss.cmd,
      settings = lsp_tss.settings,
    })
    active_lsp('tss')
  end,

  -- HTML
  html = function()
    local lsp_html = require("servers.lsp_html")
    setup_server('html', {
      on_attach = lspf.on_attach,
      capabilities = lspf.capabilities,
      filetypes = lsp_html.filetypes,
      cmd = lsp_html.cmd,
      init_options = lsp_html.init_options
    })
    active_lsp('html')
  end,

  -- CSS
  css = function()
    local lsp_css = require("servers.lsp_css")
    setup_server('cssls', {
      on_attach = lspf.on_attach,
      filetypes = lsp_css.filetypes,
      capabilities = lspf.capabilities,
      settings = lsp_css.settings
    })
    active_lsp('cssls')
  end,

  eslint = function()
    local lsp_esl = require("servers.lsp_eslint")
    setup_server('eslint', {
      on_attach = lspf.on_attach,
      capabilities = lspf.capabilities,
      settings = lsp_esl.settings,
    })
  end
}
