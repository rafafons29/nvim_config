return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = (function()
          local NVIMPATH = vim.fn.stdpath('config')
          local pathfolder = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())

          if NVIMPATH == pathfolder:sub(1, 23) then
            return {
              vim.api.nvim_get_runtime_file(NVIMPATH, true),
              vim.fn.expand('$VIMRUNTIME')
            }
          end

          return pathfolder
        end)(),
        checkThirdParty = false,
      },
    },
  },
}
