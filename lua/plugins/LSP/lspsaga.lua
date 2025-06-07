return{
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys={
    {'<leader>lh','<cmd>Lspsaga hover_doc<CR>', desc = 'Show hover_doc(LSP)'},
    {'<leader>h','<cmd>Lspsaga hover_doc<CR>', desc = 'Show hover_doc(LSP)'}
  },
  config = function ()
    require('lspsaga').setup({})
  end
}
