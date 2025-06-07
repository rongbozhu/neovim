return {
  "akinsho/bufferline.nvim", -- buffer分割线
  event = "VimEnter",
  keys = {
    {"bp","<cmd>bprev<CR>",desc="Previous buffer"},
    {"bn","<cmd>bnext<CR>",desc="Next buffer"},
    {'bd','<cmd>bdelete<CR>',desc='Delete buffer'}
  },
  config = function()
    vim.opt.termguicolors = true

    require("bufferline").setup({
      options = {
        -- 设置buffer 样式
        style_preset={
          require('bufferline').style_preset.no_italic,
        },
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        -- 打开悬浮事件
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'},
        }
      },
    })
  end,
}
