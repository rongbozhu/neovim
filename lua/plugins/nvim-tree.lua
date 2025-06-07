return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
  event = "User DirOpened",
  keys={
    {"<leader>e","<cmd>NvimTreeToggle<CR>",desc="Open expolre tree"}
  },

  config = function()
    -- 默认不开启nvim-tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup()
  end,
}
