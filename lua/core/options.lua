vim.opt.clipboard:append("unnamedplus")

vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.signcolumn = "yes:1"

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2

vim.o.expandtab = true
vim.opt.expandtab = true
vim.bo.expandtab = true

vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.incsearch = true

vim.o.cmdheight = 1

vim.o.autoread = true
vim.bo.autoread = true

vim.wo.wrap = true

vim.o.mouse = "a"
vim.o.mousemoveevent = true

vim.o.swapfile = false

vim.o.timeoutlen = 400

vim.o.list = true
vim.opt.listchars = {
  space = ".",
  trail = ".",
}

vim.o.wildmenu = true

vim.opt.shortmess:append("c")
