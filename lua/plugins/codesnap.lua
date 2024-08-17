return {
  -- {
  --   "mistricky/codesnap.nvim",
  --   build = "make build_generator",
  --   keys = {
  --     { "<leader>cc", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save selected code snapshot into clipboard" },
  --     { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  --   },
  --   opts = {
  --     save_path = "~/Pictures",
  --     has_breadcrumbs = true,
  --     bg_theme = "bamboo",
  --   },
  -- },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    ---@param opts cn.ConfigSchema
    opts = {
      base_url = "https://carbon.now.sh/",
      options = {
        bg = "gray",
        drop_shadow_blur = "68px",
        drop_shadow = false,
        drop_shadow_offset_y = "20px",
        font_family = "Hack",
        font_size = "18px",
        line_height = "133%",
        line_numbers = true,
        theme = "monokai",
        titlebar = "Made with carbon-now.nvim",
        watermark = false,
        width = "680",
        window_theme = "sharp",
        padding_horizontal = "0px",
        padding_vertical = "0px",
      },
    }
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    opts = {
      disable_defaults = true
    }
  }
}
