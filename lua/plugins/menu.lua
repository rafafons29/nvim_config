return {
  { "nvzone/volt", lazy = true },
  {
    "nvzone/menu",
    lazy = true,
    keys = {
      { "<leader>t", function()
        require("menu").open("default")
      end }
    }
  },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  }
}
