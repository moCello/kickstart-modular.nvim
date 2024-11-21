-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Tabline plugin with re-orderable, auto-sizing, klickable tabs and a
    -- magic jump-to-buffer mode.
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      {
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        enabled = vim.g.have_nerd_font,
      },
    },
    init = function()
      vim.g.barbar_auto_setup = false
      -- Cycle between buffers
      vim.keymap.set('n', '<Leader>n', '<Cmd>BufferNext<CR>', { desc = 'Move to [n]ext buffer' })
      vim.keymap.set('n', '<Leader>p', '<Cmd>BufferPrevious<CR>', { desc = 'Move to [p]revious buffer' })
      -- Close buffer
      vim.keymap.set('n', '<Leader>d', '<Cmd>BufferClose<CR>', { desc = '[C]lose buffer' })
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here,
      -- anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true
      -- …etc.
      icons = {
        filetype = {
          -- Requires `nvim-web-devicons` if `true`
          enabled = false,
        },
        separator = { left = '▎', right = '' },

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = { button = '●' },

        -- Configure the icons on the bufferline based on the visibility of a
        -- buffer.
        -- Supports all the base icon options, plus `modified` and `pinned`.
        alternate = { filetype = { enabled = true } },
        current = { buffer_index = true },
        inactive = { button = '×' },
        visible = { modified = { buffer_number = true } },
      },
    },
    -- version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
