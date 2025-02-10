return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>bf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[B]uffer [F]ormat',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format', 'ruff_organize_imports' },
      rust = { 'rustfmt', lsp_format = 'fallback' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'prettier' },
    },
  },
}
