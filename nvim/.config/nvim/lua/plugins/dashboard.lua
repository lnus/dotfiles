return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
_ _                          _     
| (_)_ __  _   _ ___ ___  ___| |__  
| | | '_ \| | | / __/ __|/ _ \ '_ \ 
| | | | | | |_| \__ \__ \  __/ |_) |
|_|_|_| |_|\__,_|___/___/\___|_.__/ 
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
