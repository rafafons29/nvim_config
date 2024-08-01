vim.cmd("autocmd!")

-- Establecer los colores de los números de línea
vim.cmd('highlight LineNr ctermfg=8') -- 8
vim.cmd('highlight CursorLineNr ctermfg=50')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.o.number = true       -- Muestra números de línea
vim.o.incsearch = true    -- Habilita la búsqueda incremental
vim.o.mouse = 'a'         -- Utilizar el ratón para algunas operaciones
vim.o.syntax = 'on'       -- Habilita el resaltado de sintaxis
vim.o.background = 'dark' -- Sirve para leer o modificar opciones generales del editor

-- Habilita la búsqueda sensible a mayúsculas y minúsculas
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ai = true -- Auto ident
vim.o.si = true -- Smart ident
vim.o.cursorline = false
vim.o.winblend = 0
vim.o.wildoptions = 'pum'
vim.o.pumblend = 5
vim.o.background = 'dark'

-- Config to Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = 'cp -r'

vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true -- Resalta los resultados de una búsqueda anterior
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = 'split'
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2  -- El espacio que Neovim usará para indentar una línea
vim.opt.tabstop = 2     -- Establece el número de espacios que se usarán para un nivel de indentación
vim.opt.softtabstop = 2 -- Establece la cantidad de espacios que se usarán para una "tabulación"
vim.opt.wrap = true     -- Hace que el texto de las lineas largas siempre este visisble
vim.opt.relativenumber = true

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup CaptureNoiceMessages
  augroup highlight_yank
  autocmd!
  autocmd FileType alpha setlocal nofoldenable
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  autocmd BufWritePost * setlocal foldmethod=manual
  augroup END
]]
