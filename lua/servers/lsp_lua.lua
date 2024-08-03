local lvm = require('servers.lsp_functions')

return function(load)
  return {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = (function(load)
            local NVIMPATH = vim.fn.stdpath('config')
            local pathfolder = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
            local rtp_to_load = {
              vim.api.nvim_get_runtime_file(NVIMPATH, true),
              vim.fn.expand('$VIMRUNTIME')
            }

            if NVIMPATH == pathfolder:sub(1, 23) or load then
              -- Comprobamos que estamos en la configuracion de nvim
              return rtp_to_load
            end

            return pathfolder
          end)(load),
          checkThirdParty = false,
        },
      },
    },
  }
end
