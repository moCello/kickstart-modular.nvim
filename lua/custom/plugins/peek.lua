-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'toppair/peek.nvim',
  -- event = { 'VeryLazy' },
  build = 'deno task --quiet build:fast',
  config = function()
    require('peek').setup {
      -- automatically loads preview when entering another markdown buffer
      auto_load = true,

      -- closes preview window on buffer delete
      close_on_bdelete = true,

      -- enables syntax highlighting, affects performance
      syntax = false,

      theme = 'dark',

      update_on_change = true,
      -- relevant if update_on_change is true:
      -- start throttling when file exceeds this amount of bytes in size
      throttle_at = 200000,
      -- minimum amount of time in milliseconds that has to pass before starting new render
      throttle_time = 'auto',

      -- 'webview', 'browser', string or a table of strings explained below
      app = 'webview',

      -- list of filetypes to recognize as markdown
      filetype = { 'markdown', 'md' },
    }
    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
  end,
}
