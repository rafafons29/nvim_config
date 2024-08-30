return {
  "p00f/clangd_extensions.nvim",
  ft = { "cpp", "c", "cc", "h", "hpp" },
  lazy = true,
  opts = {
    inlay_hints = {
      inline = vim.fn.has("nvim-0.10") == 1,
      -- Options other than `highlight' and `priority' only work
      -- if `inline' is disabled
      -- Only show inlay hints for the current line
      only_current_line = false,
      -- Event which triggers a refresh of the inlay hints.
      -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
      -- note that this may cause higher CPU usage.
      -- This option is only respected when only_current_line is true.
      only_current_line_autocmd = { "CursorHold" },
      -- whether to show parameter hints with the inlay hints or not
      show_parameter_hints = true,
      -- prefix for parameter hints
      parameter_hints_prefix = "<- ",
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",
      -- whether to align to the length of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 7,
      -- The color of the hints
      highlight = "Comment",
      -- The highlight group priority for extmark
      priority = 100,
    },
    ast = {
      -- These are unicode, should be available in any font
      role_icons = {
        type = "🄣",
        declaration = "🄓",
        expression = "🄔",
        statement = ";",
        specifier = "🄢",
        ["template argument"] = "🆃",
      },
      kind_icons = {
        Compound = "🄲",
        Recovery = "🅁",
        TranslationUnit = "🅄",
        PackExpansion = "🄿",
        TemplateTypeParm = "🅃",
        TemplateTemplateParm = "🅃",
        TemplateParamObject = "🅃",
      },
      --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            }, ]]

      highlights = {
        detail = "Comment",
      },
    },
    memory_usage = {
      border = "none",
    },
    symbol_info = {
      border = "none",
    },
  },
  config = function(opts)
    require("clangd_extensions").setup(opts)

    --! Se esta ejecutando bien. Solo que no se muestra el texto virtual,
    --! esto puede deberse a que intenta establecerlo antes de haber siquiera
    --! cargado el lsp_server, entonces lo que debemos hacer es esperar que la
    --! carga ocurra para que luego se ejecute la funcion.
    vim.api.nvim_create_autocmd({ "BufNew", "BufEnter", "BufWinEnter" }, {
      pattern = { "*.c", "*.cpp", "*.cc", "*.h", "*.hpp" },
      callback = function()
        require("clangd_extensions.inlay_hints").set_inlay_hints()
      end
    })
  end
}
