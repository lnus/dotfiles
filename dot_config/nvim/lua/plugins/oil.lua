return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ['\\'] = { 'actions.close', mode = 'n' },
      ['q'] = { 'actions.close', mode = 'n' },
      ['<BS>'] = { 'actions.parent', mode = 'n' },
    },
    view_options = {
      show_hidden = true,
    },
  },

  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  lazy = false,
  keys = {
    { '\\', ':Oil --preview --float<CR>', desc = 'Open oil', silent = true },
  },
}
