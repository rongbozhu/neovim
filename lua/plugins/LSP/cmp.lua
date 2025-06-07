return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'amarakon/nvim-cmp-fonts',
    "micangl/cmp-vimtex",
    -- for vsnip users
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    -- for ultisnips users
    -- 'SirVer/ultisnips',
    -- 'quangnguyen30192/cmp-nvim-ultisnips'
  },
  event = { "BufReadPost", "CmdlineEnter", "BufNewFile" },
  config = function()
    local cmp = require('cmp')

    local cmp_kinds = {
      Text = '  ',
      Method = '  ',
      Function = '  ',
      Constructor = '  ',
      Field = '  ',
      Variable = '  ',
      Class = '  ',
      Interface = '  ',
      Module = '  ',
      Property = '  ',
      Unit = '  ',
      Value = '  ',
      Enum = '  ',
      Keyword = '  ',
      Snippet = '  ',
      Color = '  ',
      File = '  ',
      Reference = '  ',
      Folder = '  ',
      EnumMember = '  ',
      Constant = '  ',
      Struct = '  ',
      Event = '  ',
      Operator = '  ',
      TypeParameter = '  ',
      LaTeX = "  ",
      Fonts = "  ",
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
          -- vim.fn["UltiSnips#Anon"](args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered({
          position = 'right',
          border = "single",
        }),
      },
      view = {
        docs = {
          auto_open = true,
        }
      },
      formatting = {
        fields = { "kind", "abbr" },
        format = function(entry, vim_item)
          if entry.source.name == "vimtex" then
            vim_item.kind = cmp_kinds.LaTeX
          elseif entry.source.name == "fonts" then
            vim_item.kind = cmp_kinds.Fonts
          else
            vim_item.kind = cmp_kinds[vim_item.kind] or ""
          end
          return vim_item
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm({ select = true }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            else
              cmp.select_next_item()
            end
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<S-Tab'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      }),
      sources = cmp.config.sources({
        { name = 'vimtex' },
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        -- { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'buffer' },
        { name = 'fonts' },
      })
    })

    -- `/` cmdline setup
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig').lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            --vim,
            globals = { 'vim', }
          }
        }
      },
      on_attach = function(client, bufnr)
        -- 确保 LSP 服务器支持 hover 功能
        if client.server_capabilities.hoverProvider then
          vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.hover()
            end,
          })
        end
      end,
    })
    require('lspconfig').ruff.setup {
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = 'off',
          },
        },
      }
    }
    require('lspconfig').neocmake.setup {
      capabilities = capabilities
    }
    require('lspconfig').clangd.setup {
      capabilities = capabilities
    }
    require('lspconfig').tinymist.setup{
      capabilities = capabilities,
      settings={
        formatterMode='typstyle',
        exportPdf='onType',
        semanticTokens='disable'
      }
    }
    require('lspconfig').texlab.setup {
      capabilities = capabilities,
      settings = {
        texlab = {
          diagnostics = {
            ignoredPatterns = {
              "Package fancyhdr Warning",
              "Overfull",
              "Underfull",
              "Duplicate label",
              "Package hyperref Warning",
              "Undefined reference",
              "Unused label",
            },
          },
          latexFormatter = "latexindent",
        },
      },
    }
  end,
}
