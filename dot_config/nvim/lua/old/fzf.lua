-- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
-- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
-- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
-- vim.keymap.set('n', '<leader>sc', builtin.highlights, { desc = '[S]earch [C]olors/highlights' })
-- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- opts = {},
-- cmd = { 'FzfLua' },
-- keys = {
--   -- Leader commands
--   -- { '<leader>sr', '<cmd>FzfLua resume<cr>', desc = '[S]earch [R]esume' },
--   -- { '<leader>sf', '<cmd>FzfLua files<cr>', desc = '[S]earch [F]iles' },
--   -- { '<leader>sg', '<cmd>FzfLua grep<cr>', desc = '[S]earch by [G]rep' },
--   -- { '<leader><leader>', '<cmd>FzfLua buffers<cr>', desc = '[ ] Find existing buffers' },
--
--   -- Ctrl commands
--   { '<C-g>', '<cmd>FzfLua grep<cr>', desc = 'Search by Grep' },
--   { '<C-p>', '<cmd>FzfLua files<cr>', desc = 'Search files' },
--   { '<C-\\>', '<cmd>FzfLua buffers<cr>', desc = 'Search buffers' },
--   { '<C-l>', '<cmd>FzfLua live_grep<cr>', desc = 'Search by livegrep' },
-- },
--
local opts = {
  winopts = {
    fullscreen = true, -- start fullscreen
  },
}

return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('fzf-lua').setup(opts)

    local fzf = require 'fzf-lua'

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { desc = 'FZF: ' .. desc })
    end

    map('<C-p>', fzf.files, 'Find files')
    map('<leader>sf', fzf.files, '')
  end,
}
