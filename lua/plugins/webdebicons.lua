return {
  'kyazdani42/nvim-web-devicons',
  opts = function()
    local devicons = require('nvim-web-devicons')
    
    return {
      override = {},
      default = true,
    }
  end,
}
