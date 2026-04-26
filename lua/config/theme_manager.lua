local M = {}

-- Almacena el nombre del tema actual
M.current_theme = nil

-- Lista de temas disponibles
M.available_themes = {
  "catppuccin",
  "tokyonight", 
  "onedark",
  "andromeda",
  "oxocarbon",
  "nightfox",
}

-- Función principal para cambiar el tema dinámicamente
function M.load_theme(theme_name)
  if not theme_name or theme_name == M.current_theme then
    return false
  end

  -- Verificar si el tema existe en la lista
  local found = false
  for _, theme in ipairs(M.available_themes) do
    if theme == theme_name then
      found = true
      break
    end
  end

  if not found then
    vim.notify("Theme '" .. theme_name .. "' not available", vim.log.levels.ERROR)
    return false
  end

  -- 1. Limpiar tema anterior (si existe y el plugin lo soporta)
  if M.current_theme then
    local ok, prev_plugin = pcall(require, M.current_theme)
    if ok and type(prev_plugin.teardown) == "function" then
      prev_plugin.teardown()
    end
  end

  -- 2. Cargar nuevo tema
  local ok, plugin = pcall(require, theme_name)
  if not ok then
    vim.notify("Error loading theme: " .. theme_name, vim.log.levels.ERROR)
    return false
  end

  -- 3. Aplicar configuración específica del tema (setup) si existe
  -- Muchos temas modernos permiten pasar opciones aquí
  if type(plugin.setup) == "function" then
    plugin.setup()
  end

  -- 4. Establecer el colorscheme
  vim.cmd.colorscheme(theme_name)

  -- 5. Actualizar referencias
  M.current_theme = theme_name
  
  -- 6. Disparar evento para que otros plugins se actualicen (lualine, bufferline, etc.)
  vim.api.nvim_exec_autocmds("User", { pattern = "ThemeChanged", data = { theme = theme_name } })

  vim.notify("Theme changed to: " .. theme_name, vim.log.levels.INFO)
  return true
end

-- Función para aplicar highlights personalizados después del tema
-- Debe ser llamada por tu config de highlights o integrada aquí
function M.apply_custom_highlights(highlight_func)
  if highlight_func then
    highlight_func()
  end
end

return M
