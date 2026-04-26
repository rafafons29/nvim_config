require("config")

-- Inicializar el sistema de temas ANTES de cargar el colorscheme
local themes = require("plugins.themes")
themes.setup()

-- El tema se carga automáticamente por lazy.nvim a través de los plugins de temas
-- No necesitamos llamar a vim.cmd.colorscheme() aquí porque ya se hace en theme_manager.lua
