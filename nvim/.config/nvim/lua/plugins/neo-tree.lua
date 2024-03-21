return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Good icons
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Image support in preview window
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>')
  end
}
