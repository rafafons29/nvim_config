return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
cmdline = {
        format = {
          cmdline = { icon = ">" },
          search_down = { icon = "🔍⌄" },
          search_up = { icon = "🔍⌃" },
          filter = { icon = "$" },
          lua = { icon = "☾" },
          help = { icon = "?" },
        },
      },
      format = {
        level = {
          icons = {
            error = " ",
            warn = " ",
            info = " ",
          },
        },
      },
      popupmenu = {
        kind_icons = true,
      },
      inc_rename = {
        cmdline = {
          format = {
            IncRename = { icon = "⟳" },
          },
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = false,
        inc_rename = true,
        lsp_doc_border = true,
      },
      throttle = 1000 / 30,
      views = {
        split = {
          enter = true,
        },
      },
      status = {},
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      commands = {
        history = {
          view = "split",
          opts = { enter = true, skip = true, format = "details" },
          filter = {},
        },
      },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  }
}
