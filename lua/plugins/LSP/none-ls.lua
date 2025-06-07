return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local formatting = require('null-ls').builtins.formatting

    require('null-ls').setup({
      debug = false,
      sources = {
        formatting.black,
      },
    })
  end
}
