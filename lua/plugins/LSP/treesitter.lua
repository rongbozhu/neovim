return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim"
  },
  cmd = { 'TSUpdate', 'TSInstall' },
  event = { 'VeryLazy' },
  config = function()
    require 'nvim-treesitter.configs'.setup({
      ensure_installed = { 'c', 'python', 'lua'},
      sync_install = false,
      auto_install = true,
      ignore_install = { 'latex' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        }
      },
      indent = { enable = true },
        })
  end
}
