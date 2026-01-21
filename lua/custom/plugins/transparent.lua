return {
  'https://github.com/xiyaowong/transparent.nvim.git',
  config = function()
    require('transparent').setup {
      on_clear = function() end,
    }
    -- require('transparent').clear_prefix 'lualine'
    -- require('transparent').clear_prefix 'ToggleTerm'
  end,
}
