-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local npairs = require("nvim-autopairs")
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

-- snippets --
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

-- Git completion --
require("cmp_git").setup({})

-- autopairs --
-- Auto open function on { <CR>
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- autopairs with treesitter --
npairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},-- it will not add a pair on that treesitter node
    javascript = {'template_string'},
    typescript = {'template_string'},
    java = false,-- don't check treesitter on java
  }
})

-- cmp --
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'emoji' },
    { name = 'git' },
  },
}

-- Autocompletes @ and # when using Octo for github
vim.cmd('autocmd FileType * lua setKeybinds()')
function setKeybinds()
    local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
    local opts = { prefix = '<localleader>', buffer = 0 }

    if fileTy == 'octo' then
      vim.keymap.set("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })
      vim.keymap.set("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
    end
end
