return {
  {
    'rcarriga/nvim-notify',
    opts = {
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
      fps = 90,
      icons = {
        DEBUG = " ",
        ERROR = " ",
        INFO = " ",
        TRACE = "✎",
        WARN = " "
      },
      level = 2,
      minimum_width = 50,
      render = "compact",
      stages = "slide",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
      },
      timeout = 3000,
      top_down = true,
    },
    config = function(_, opts)
      local status, notify = pcall(require, "notify")
      if not status then
        print("Notify is not working")
        return
      end

      notify.setup(opts)

      -- Set highlight groups
      vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#8A1F1F" })
      vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#79491D" })
      vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#4F6752" })
      vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#8B8B8B" })
      vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#4F3552" })
      vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = "#F70067" })
      vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = "#F79000" })
      vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#A9FF68" })
      vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = "#8B8B8B" })
      vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = "#D484FF" })
      vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#F70067" })
      vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = "#F79000" })
      vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#A9FF68" })
      vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = "#8B8B8B" })
      vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = "#D484FF" })
      vim.api.nvim_set_hl(0, "NotifyERRORBody", {})
      vim.api.nvim_set_hl(0, "NotifyWARNBody", {})
      vim.api.nvim_set_hl(0, "NotifyINFOBody", {})
      vim.api.nvim_set_hl(0, "NotifyDEBUGBody", {})
      vim.api.nvim_set_hl(0, "NotifyTRACEBody", {})

      -- Define global `noty` object with `notify` and `get_plugin` functions
      _G.noty = {}
      noty.notify = notify
      noty.get_plugin = function(plugin_name)
        local statuss, plugin = pcall(require, plugin_name)
        if not statuss then
          notify(plugin_name .. " is not working 😳", "warn")
          return nil
        end
        return plugin
      end
    end,
  }
}
