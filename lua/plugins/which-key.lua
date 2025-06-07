return {
  "folke/which-key.nvim",
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require('which-key')
    wk.add({
      -- LSP
      { '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', desc = 'Format code(LSP)' },
      { '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', desc = 'Show definition(LSP)' },
      { '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', desc = 'Show references(LSP)' },
      -- window
      {'<leader>wh','<cmd>split<CR>', desc = 'Horizontally split window'},
      {'<leader>wv','<cmd>vsplit<CR>', desc = 'Vertically split window'},
      {'<leader>wc','<cmd>close<CR>', desc = 'Close current window'},
      {'<leader>wo','<cmd>only<CR>', desc = 'Only remain current window'},
      -- no hlight
      {'<leader>nl','<cmd>nohlsearch<CR>',desc='No hlight search'},
    })
  end
}
