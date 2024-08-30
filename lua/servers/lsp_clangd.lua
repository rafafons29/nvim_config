return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

    vim.keymap.set("n", "<leader>lh", function()
      local clg_hints = require("clangd_extensions.inlay_hints")

      if clg_hints.toggle_inlay_hints() then
        clg_hints.set_inlay_hints()
      else
        clg_hints.disable_inlay_hints()
      end
    end, { desc = "[l]sp [h]ints toggle" })
  end
}
