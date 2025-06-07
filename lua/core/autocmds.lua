vim.cmd([[autocmd InsertLeave *  :w]])

vim.cmd([[autocmd InsertLeave :!im-select 2052]])
  vim.api.nvim_create_autocmd("InsertLeave",{
  callback = function ()
    vim.fn.jobstart('im-select 1033')
  end,
  desc = 'chinese ime when enter insert mode',
})
