return {
  "anuvyklack/animation.nvim",
  dependencies = {
    "anuvyklack/middleclass",
  },
  keys = {
    { "<leader>aa", function()
      require("config.plugins.animation").redraw_buffer()
    end }
  },
}
