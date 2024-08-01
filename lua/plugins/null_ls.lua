return {
  'jose-elias-alvarez/null-ls.nvim',
  opts = {
    sources = {
      require('null-ls').builtins.formatting.prettierd,
      require('null-ls').builtins.formatting.clang_format,
      require('null-ls').builtins.formatting.autopep8,
      require('null-ls').builtins.formatting.gofumpt,
      require('null-ls').builtins.formatting.goimports_reviser,
      require('null-ls').builtins.formatting.golines,
      -- require('null-ls').builtins.diagnostics.eslint_lsp.with({
      --   diagnostics_format = '[eslint] #{m}\n(#{c})'
      -- }),
      require('null-ls').builtins.diagnostics.fish,
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({
              filter = function(c)
                return c.name == "null-ls"
              end,
              bufnr = bufnr,
            })
          end,
        })
      end
    end
  },
  cmd = { 'NullLsInfo', 'NullLsInstall', 'NullLsUninstall' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
