return {
  'glepnir/lspsaga.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-tree/nvim-web-devicons' },
  opts = {
    ui = {
      border = 'rounded',
    },
    symbol_in_winbar = {
      enable = false
    },
    lightbulb = {
      enable = false
    },
    outline = {
      layout = 'float'
    }
  },
  keys = {
    { '<C-j>', cmd 'Lspsaga diagnostic_jump_next',     mode = 'n' },
    { 'gl',    cmd 'Lspsaga show_line_diagnostics',    mode = 'n' },
    { 'K',     cmd 'Lspsaga hover_doc',                mode = 'n' },
    { 'gd',    cmd 'Lspsaga finder',                   mode = 'n' },
    { 'gt',    cmd 'Lspsaga goto_type_definition',     mode = 'n' },
    { '<C-k>', cmd 'Lspsaga signature_help',           mode = 'i' },
    { '<C-k>', cmd 'lua vim.lsp.buf.signature_help()', mode = 'i' },
    { 'gp',    cmd 'Lspsaga peek_definition',          mode = 'n' },
    { 'gr',    cmd 'Lspsaga rename',                   mode = 'n' },
  },
  config = function(_, opts)
    require('lspsaga').setup(opts)
  end,
}
