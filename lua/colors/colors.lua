return (function(filename)
  local file = io.open("/home/rafa/.config/nvim/lua/colors/" .. filename .. ".json", "r")
  if not file then
    error("No se pudo leer el archivo " .. filename)
  end

  local content = file:read("*a")
  file:close();

  if not content or content == "" then
    error("El archivo esta vacio o no contiene datos validos")
  end

  -- Transformar el contenido JSON en una tabla lua
  content = content:gsub('"([^"]+)"%s*:%s*', '["%1"] = '):gsub('"([^"]+)"', '"%1"')

  -- Ejecutar el contenido como codigo Lua
  local table = load("return " .. content)()

  return table
end)
