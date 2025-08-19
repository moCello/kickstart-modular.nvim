-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    -- Open chat with :CopilotChatOpen and connect device to github
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    init = function()
      -- Set keybindings
      vim.keymap.set('n', '<Leader>cc', '<Cmd>CopilotChatOpen<CR>', { desc = 'Open [c]opilot [c]hat' })
    end,
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
      -- https://copilotc-nvim.github.io/CopilotChat.nvim/#/?id=configuration
      model = 'gpt-4.1', -- AI model to use
      temperature = 0.1, -- Lower = focused, higher = creative
      window = {
        layout = 'horizontal', -- 'vertical', 'horizontal', 'float'
        width = 0.5, -- 50% of screen width
      },
      headers = {
        user = '👤 You: ',
        assistant = '🤖 Copilot: ',
        tool = '🔧 Tool: ',
      },
      separator = '━━',
      -- Use visual selection, fallback to current buffer
      selection = function(source)
        return require('CopilotChat.select').visual(source) or require('CopilotChat.select').buffer(source)
      end,
      auto_insert_mode = true, -- Enter insert mode when opening
    },
  },
}
