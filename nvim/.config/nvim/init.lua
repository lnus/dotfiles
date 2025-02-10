require 'core.options'
require 'core.keymaps'
require 'core.autocommands'

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup {
  require 'plugins.rose-pine',
  require 'plugins.neotree',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.completions',
  require 'plugins.conform',
  require 'plugins.gitsigns',
  require 'plugins.indent-blankline',
  require 'plugins.which-key',
  require 'plugins.misc',
  -- require('dev.stalker').profile 'live',
  require('dev.fencey').profile 'live',
}
