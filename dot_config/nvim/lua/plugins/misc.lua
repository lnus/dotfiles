-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- tmux integration
    'christoomey/vim-tmux-navigator',
    lazy = false,
    config = function()
      vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>')
      vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>')
      vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>')
      vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>')
    end,
  },
  {
    -- autoclose tags
    'windwp/nvim-ts-autotag',
  },
  {
    -- detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- high-performance color highlighter
    -- #123456 <- so you remember what it does
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'bezhermoso/tree-sitter-ghostty',
    build = 'make nvim_install',
  },
  {
    'fladson/vim-kitty',
    ft = 'kitty',
    -- tag = "*"  -- You can select a tagged version
  },
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = { 'markdown' },
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    keys = {
      { '<C-r>', '<Plug>MarkdownPreviewToggle', desc = 'Toggle Markdown Preview', ft = 'markdown' },
    },
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    keys = {
      { '<C-r>', '<cmd>TypstPreviewToggle<CR>', desc = 'Toggle Typst Preview', ft = 'typst' },
    },
  },
}
