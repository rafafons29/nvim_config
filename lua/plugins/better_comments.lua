return {
  'Djancyp/better-comments.nvim', -- Reemplaza 'username' con el nombre correcto del repositorio
  config = function()
    local bttc = require('better-comment')
    if not bttc then return end

    bttc.Setup({
      tags = {
        {
          name = "!",
          fg = "#FF2D00",
          bg = "",
          bold = false,
          -- virtual_text = " ",
        },
        {
          name = "`",
          fg = "#3498DB",
          bg = "",
          bold = false,
          -- virtual_text = " ",
        },
        {
          name = ",",
          fg = "#2387AA",
          bg = "",
          bold = false,
          -- virtual_text = "",
        },
        {
          name = ":",
          fg = "#FF8C00",
          bg = "",
          bold = false,
          -- virtual_text = " ",
        },
        {
          name = "*",
          fg = "#98C379",
          bg = "",
          bold = false,
        },
        {
          name = "=",
          fg = "#6F51A1",
          bg = "",
          bold = false,
        },
        {
          name = "-",
          fg = "#5E30B0",
          bg = "",
          bold = false,
        },
      }
    })
  end,
}
