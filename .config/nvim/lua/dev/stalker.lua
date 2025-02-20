local M = {}

function M.profile(p)
  local config = {
    verbose = false,
    -- store_locally = true, -- Should save stats to file
    -- sync_endpoint = 'http://localhost:8000/stalker', -- Optional web sync endpoint
    -- sync_interval = 5, -- How often to save to file/send to endpoint
    realtime = {
      enabled = false,
      ws_endpoint = 'ws://localhost:8000/ws',
      -- sync_endpoint = 'http://localhost:8000/sync',
      headers = {
        Authorization = 'Secret-Token',
      },
    },
  }
  if p == 'live' then
    return {
      'lnus/stalker.nvim',
      opts = config,
    }
  end
  if p == 'dev' then
    return {
      dir = '~/Projects/stalker.nvim',
      dev = true,
      opts = config,
    }
  end
end

return M
