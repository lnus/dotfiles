local M = {}

function M.profile(p)
  local config = {}
  if p == 'live' then
    return {
      'lnus/fencey.nvim',
      opts = config,

      cmd = { 'FenceYank' },
      keys = {
        { '<leader>yf', '<cmd>FenceYank<cr>', desc = '[Y]ank [F]ence' },
      },
    }
  end
  if p == 'dev' then
    return {
      dir = '~/Projects/fencey.nvim',
      dev = true,
      opts = config,

      keys = {
        { '<leader>yf', '<cmd>FenceYank<cr>', desc = '[Y]ank [F]ence' },
      },
    }
  end
end

return M
