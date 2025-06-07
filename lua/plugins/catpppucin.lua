return{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      no_italic = true,
      styles = {
        keywords = {"bold"},
      }
    })
    vim.cmd([[colorscheme catppuccin-frappe]])
  end,
}
