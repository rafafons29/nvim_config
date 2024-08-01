local andromeda = require("andromeda")
local M = {}

-- andromeda.setup({
--   preset = "andromeda",
--   transparent_bg = false,
--   colors = { background = "#292c36" },
--   styles = { italic = true }
-- })

function M.setup()
  andromeda.setup({
    preset = "andromeda",
    transparent_bg = false,
    styles = { italic = true },
    colors = {
      background = "#1e1e1f",
      mono_1 = "#2e2e2e",
      mono_2 = "#3a3c3e",
      mono_3 = "#6F6F6F",
      mono_4 = "#ee5d43",
      mono_5 = "#B3ACA7",
      mono_6 = "#B3ACB7",
    },
  })
end

return M
