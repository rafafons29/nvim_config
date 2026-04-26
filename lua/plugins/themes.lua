local theme_manager = require("config.theme_manager")

-- Lista de temas disponibles
local M = {}
M.available_themes = theme_manager.available_themes

-- Tema actual
M.current_theme = nil

-- Función principal para cambiar el tema dinámicamente
function M.change_theme(theme_name)
  if not theme_name then
    vim.notify("No theme specified", vim.log.levels.ERROR)
    return false
  end

  -- Usar el theme_manager para cargar el tema
  local success = theme_manager.load_theme(theme_name)
  
  if not success then
    return false
  end

  -- Actualizar la variable global theme_name
  _G.theme_name = theme_name
  M.current_theme = theme_name
  
  -- Recargar configuraciones que dependen del tema
  M.reload_theme_dependent_configs()

  vim.notify("Theme changed to: " .. theme_name, vim.log.levels.INFO)
  return true
end

-- Recargar configuraciones que dependen del tema
function M.reload_theme_dependent_configs()
  -- Recargar lualine
  local lualine_ok, lualine_module = pcall(require, "config.plugins.lualine")
  if lualine_ok then
    pcall(lualine_module.setup)
  end

  -- Recargar incline
  local incline_ok, incline_module = pcall(require, "config.plugins.incline")
  if incline_ok then
    pcall(incline_module.setup)
  end

  -- Recargar bufferline highlights
  local bufferline_ok, bufferline_config = pcall(require, "plugins.bufferline")
  if bufferline_ok and type(bufferline_config.opts) == "function" then
    local bufferline = require("bufferline")
    if bufferline then
      pcall(function()
        bufferline.setup(bufferline_config.opts())
      end)
    end
  end

  -- Disparar evento User para que otros plugins puedan reaccionar
  vim.api.nvim_exec_autocmds("User", { 
    pattern = "ThemeChanged", 
    data = { theme = _G.theme_name } 
  })
end

-- Toggle entre temas (para keymaps rápidos)
function M.toggle_theme()
  local current = _G.theme_name or "catppuccin"
  local current_idx = 1
  
  for i, theme in ipairs(M.available_themes) do
    if theme == current then
      current_idx = i
      break
    end
  end
  
  local next_idx = (current_idx % #M.available_themes) + 1
  local next_theme = M.available_themes[next_idx]
  
  M.change_theme(next_theme)
end

-- Setup inicial
function M.setup()
  -- Establecer el tema inicial
  if not _G.theme_name then
    _G.theme_name = "catppuccin" -- tema por defecto
  end
  
  M.current_theme = _G.theme_name
  
  -- Crear comando para cambiar tema
  vim.api.nvim_create_user_command("Theme", function(opts)
    local theme = opts.args
    if theme == "" then
      -- Mostrar temas disponibles
      vim.notify("Available themes: " .. table.concat(M.available_themes, ", "), vim.log.levels.INFO)
      return
    end
    M.change_theme(theme)
  end, {
    nargs = "?",
    complete = function()
      return M.available_themes
    end,
    desc = "Change color theme"
  })
  
  -- Keymap para toggle de temas (opcional)
  vim.keymap.set("n", "<leader>th", M.toggle_theme, { desc = "Toggle theme" })
end

return M
