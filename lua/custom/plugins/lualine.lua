return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local auto_theme = require 'lualine.themes.auto'
    auto_theme.normal.c.bg = 'NONE'
    require('lualine').setup {
      options = {
        theme = auto_theme,
      },
    }
    vim.api.nvim_set_hl(0, 'LualineNormalC', { bg = 'NONE' })
  end,
}
