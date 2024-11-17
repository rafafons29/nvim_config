local servers = require("servers.servers")
local lspf = require("servers.lsp_functions")
local lsp_lua = require("servers.lsp_lua")(true)

return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/nvim-compe', 'L3MON4D3/LuaSnip', 'VonHeikemen/lsp-zero.nvim' }, -- Asumiendo que usas compe y LuaSnip
  opts = {},
  config = function()
    local function setup_autocmd(filetype, setup_func)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetype,
        callback = setup_func,
      })
    end

    setup_autocmd('lua', servers.lua)
    setup_autocmd('go', servers.go)
    setup_autocmd('python', servers.py)
    setup_autocmd({ 'c', 'cpp' }, servers.clangd)
    setup_autocmd({ 'qml', 'qmljs' }, servers.qmlls)
    setup_autocmd('cmake', servers.cmake)
    setup_autocmd({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }, servers.tss)
    setup_autocmd({ 'html', 'markdown' }, servers.html)
    setup_autocmd('css', servers.css)
    setup_autocmd({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }, servers.eslint)
    setup_autocmd({ 'sh' }, servers.bash)
    setup_autocmd({ "css", "html", "javascript", "javascriptreact", "typescriptreact" }, servers.emmet)


    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = false,
        severity_sort = true,
      }
    )

    -- Diagnostic symbols in the sign column (gutter)
    for type, icon in pairs(lspf.signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    keymap_set({
      { 'n', '<leader>lv', function()
        require("lspconfig").lua_ls.setup {
          on_attach = function(client, bufnr)
            lspf.on_attach(client, bufnr)
            lspf.enable_format_on_save(client, bufnr)
          end,
          settings = lsp_lua.settings
        }
        vim.cmd('LspRestart lua_ls')
        vim.notify('Vim modules are avaible')
      end, { desc = "Load vim modules" } }
    })

    keymap_set({
      { 'n', '<leader>ml', function()
        local lspconfig = require('lspconfig')
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
          lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        -- Configuración del servidor LSP para QML usando qmlls6
        local configs = require('lspconfig.configs')

        if not configs.qml6_lsp then
          configs.qml6_lsp = {
            default_config = {
              cmd = { 'qmlls6' },                              -- Comando para iniciar el servidor
              filetypes = { 'qml' },                           -- Tipos de archivo que manejará
              root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname) -- Encuentra el directorio raíz del proyecto
              end,
              settings = {},
            },
          }
        end

        lspconfig.qml6_lsp.setup {}
      end }
    })
  end,
}
