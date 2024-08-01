return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  opts = function()
    local dap_go = require('dap-go')
    dap_go.setup {
      -- Configuraciones adicionales para dap
      dap_configurations = {
        {
          -- Debe ser "go" o será ignorado por el plugin
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      -- Configuraciones de delve
      delve = {
        -- La ruta al ejecutable dlv que se usará para depurar.
        path = "dlv",
        -- Tiempo de espera para que delve inicie la sesión de depuración.
        initialize_timeout_sec = 20,
        -- Cadena que define el puerto para iniciar el depurador delve.
        port = "${port}",
        -- Argumentos adicionales para pasar a dlv
        args = {},
        -- Las banderas de construcción que se pasan a delve.
        build_flags = "",
        -- Si el proceso dlv se debe crear en modo separado o no.
        detached = true,
        -- El directorio de trabajo actual para ejecutar dlv, si es diferente del directorio actual.
        cwd = nil,
      },
    }
  end,
}
