return {
  'numToStr/Comment.nvim',
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  opts = function()
    local comment = require('Comment')

    comment.setup {
      pre_hook = function(ctx)
        -- Solo calcular commentstring para tipos de archivo tsx
        if vim.bo.filetype == 'typescriptreact' then
          local U = require('Comment.utils')

          -- Determinar si usar commentstring de línea o de bloque
          local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

          -- Determinar la ubicación desde donde calcular commentstring
          local location = nil
          if ctx.ctype == U.ctype.blockwise then
            location = require('ts_context_commentstring.utils').get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
          end
        end
      end,
    }
  end,
}
