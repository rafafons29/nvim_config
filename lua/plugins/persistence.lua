return {
  "folke/persistence.nvim",
  lazy = false,
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    { "<leader>sq", function() require("persistence").load() end,                mode = "n" },
    { "<leader>Sq", function() require("persistence").select() end,              mode = "n" },
    { "<leader>lq", function() require("persistence").load({ last = true }) end, mode = "n", desc = "Load last sesion" },
    { "<leader>dq", function() require("persistence").stop() end,                mode = "n" },
  }
}
