return {
  cmd = {
    "clangd",
    "--compile-commands-dir=build",
    "-fmodules-ts"
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  settings = {
    clangd = {
      clangdFilesStatus = true,
      clangdFlags = { "--background-index", "--clang-tidy" }
    }
  },
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    local group = vim.api.nvim_create_augroup("clangd_no_inlay_hints_in_insert", { clear = true })

    vim.keymap.set("n", "<leader>lh", function()
      if require("clangd_extensions.inlay_hints").toggle_inlay_hints() then
        vim.api.nvim_create_autocmd("InsertEnter", {
          group = group,
          buffer = bufnr,
          callback = require("clangd_extensions.inlay_hints").disable_inlay_hints
        })
        vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
          group = group,
          buffer = bufnr,
          callback = require("clangd_extensions.inlay_hints").set_inlay_hints
        })
      else
        vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
      end
    end, { buffer = bufnr, desc = "[l]sp [h]ints toggle" })
  end
}
