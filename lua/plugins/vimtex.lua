return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  tag = "v2.15",
  dependencies = {
    "SirVer/ultisnips",
    "sillybun/zyt-snippet",
  },
  ft = { 'tex' },
  keys = {
    { '<leader>lv', '<cmd>VimtexView<CR>',    desc = 'View pdf' },
    { '<leader>ll', '<cmd>VimtexCompile<CR>', desc = 'Compile tex source' },
    { '<leader>lt', '<cmd>VimtexTocOpen<CR>', desc = 'Open Contents tree' },
    { '<leader>le', '<cmd>VimtexErrors<CR>',  desc = 'Show compile errors' },
  }
  ,
  init = function()
    vim.g.tex_flavor = "latex"

    -- compiler config
    vim.g.vimtex_compiler_method = "latexmk"
    vim.cmd([[
      let g:vimtex_compiler_latexmk={
        \ 'build_dir': {-> 'out'},
        \ 'executable': 'latexmk',
        \ 'options' : [
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \ }
    ]])
    vim.cmd([[
      let g:vimtex_compiler_latexmk_engines={
        \ '_': '-xelatex',
        \ 'paflatex': '-pdf',
        \ 'dvipdfex': '-pdfdvi',
        \ 'lualatex': '-lualatex',
        \ 'xelatex': '-xelatex',
        \ 'context (pdftex)': '-pdf -pdflatex=texexec',
        \ 'context (luatex)': '-pdf -pdflatex=context',
        \ 'context (xetex)': '-pdf -pdflatex=''texexec --xtx''',
        \}
    ]])
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_mode = 0

    -- contents config
    vim.g.vimtex_toc_config = {
      name = "目录",
      mode = 1,
      layers = { "content", "todo", "include" },
      split_width = 30,
      todo_sorted = 0,
      show_help = 0,
      show_numbers = 1,
    }

    -- open conceal
    vim.o.conceallevel = 1
    vim.g.tex_conceal = "abdmg"

    -- auto completions
    vim.g.vimtex_complete_enabled = 1

    -- ultisnip configure
    vim.g.UltiSnipsExpandTrigger = '<C-b>'
    vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
    vim.g.UltiSnipsJumpBackwardTrigger = '<S-tab>'
    vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "mysnippet" }
  end
}
