# 🎨 Sistema de Temas Dinámicos

Este sistema permite cambiar entre múltiples temas de Neovim **en tiempo real** sin necesidad de reiniciar.

## 📋 Temas Disponibles

- `catppuccin` (por defecto)
- `tokyonight`
- `onedark`
- `andromeda`
- `oxocarbon`
- `nightfox`

## 🚀 Uso

### 1. Comando de Neovim

```vim
:Theme <nombre_del_tema>
```

Ejemplos:
```vim
:Theme catppuccin
:Theme tokyonight
:Theme onedark
```

Para ver la lista de temas disponibles:
```vim
:Theme
```

### 2. Keymap (Atajo de teclado)

Presiona `<leader>th` para ciclar entre todos los temas disponibles.

### 3. Desde Lua

```lua
require("plugins.themes").change_theme("catppuccin")
```

## 🔄 Cambio en Tiempo Real

Cuando cambias de tema, el sistema automáticamente:

1. ✅ Carga el nuevo colorscheme
2. ✅ Recarga la configuración de **lualine** (statusline)
3. ✅ Recarga la configuración de **incline** (buffer tabs)
4. ✅ Actualiza los highlights de **bufferline**
5. ✅ Dispara un evento `User ThemeChanged` para que otros plugins puedan reaccionar

## ⚙️ Configuración

### Tema por Defecto

El tema por defecto es `catppuccin`. Puedes cambiarlo en `/lua/plugins/themes.lua`:

```lua
function M.setup()
  if not _G.theme_name then
    _G.theme_name = "tu_tema_preferido" -- Cambia esto
  end
  -- ...
end
```

### Añadir un Nuevo Tema

1. Instala el plugin del tema en `/lua/plugins/theme_definitions.lua`
2. Crea su configuración en `/lua/config/plugins/<tema>.lua`
3. Añade el nombre a la lista en `/lua/config/theme_manager.lua`:

```lua
M.available_themes = {
  "catppuccin",
  "tokyonight", 
  "onedark",
  "andromeda",
  "oxocarbon",
  "nightfox",
  "mi_nuevo_tema", -- ← Añádelo aquí
}
```

## 🛠️ Arquitectura

```
init.lua
  ├── require("config")           → Carga configuración base
  └── themes.setup()              → Inicializa el sistema de temas
       ├── Define _G.theme_name   → Variable global accesible por todos los plugins
       ├── Crea comando :Theme    → Para cambiar temas manualmente
       └── Crea keymap <leader>th → Para cycling rápido

lua/config/theme_manager.lua
  ├── load_theme(name)            → Función principal de carga
  ├── apply_custom_highlights()   → Aplica overrides personalizados
  └── available_themes            → Lista de temas soportados

lua/plugins/themes.lua
  ├── change_theme(name)          → API pública para cambiar tema
  ├── reload_theme_dependent_configs() → Recarga plugins dependientes
  └── toggle_theme()              → Cycle entre temas
```

## 📝 Notas Importantes

1. **Variable Global**: El sistema usa `_G.theme_name` como variable global para que todos los plugins puedan acceder al tema actual.

2. **Plugins Dependientes**: Los siguientes plugins se recargan automáticamente al cambiar de tema:
   - `lualine.nvim` (statusline)
   - `incline.nvim` (buffer tabs flotantes)
   - `bufferline.nvim` (buffer tabs)

3. **Colores Personalizados**: El sistema lee los colores desde `/lua/colors/colors.lua`, que carga archivos JSON con la paleta de cada tema.

4. **Evento User**: Se dispara `User ThemeChanged` después de cada cambio, permitiendo que otros plugins escuchen y reaccionen.

## 🐛 Troubleshooting

### El tema no cambia
- Verifica que el nombre del tema esté bien escrito
- Asegúrate de que el plugin del tema esté instalado (`:Lazy sync`)
- Revisa que exista el archivo de configuración en `/lua/config/plugins/<tema>.lua`

### Los colores se ven mal
- Verifica que el archivo JSON de colores exista en `/home/rafa/.config/colors/<tema>.json`
- Revisa que la función `setup()` del tema se esté ejecutando correctamente

### Error al cargar
- Ejecuta `:checkhealth` para diagnosticar problemas
- Revisa los logs con `:messages`

## 💡 Tips

- Usa `:Theme` seguido de `<Tab>` para autocompletar nombres de temas
- El keymap `<leader>th` es útil para probar rápidamente diferentes temas
- Puedes crear tu propio comando o keymap llamando a `require("plugins.themes").change_theme("nombre")`
