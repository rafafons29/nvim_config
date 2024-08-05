local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local M = {}

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

local function formatForTailwindCSS(entry, vim_item)
  if vim_item.kind == 'Color' and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
    if r then
      local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
      local group = 'Tw_' .. color
      if vim.fn.hlID(group) < 1 then
        vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
      end
      vim_item.kind = "●"
      vim_item.kind_hl_group = group
      return vim_item
    end
  end
  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
  return vim_item
end

function M.setup()
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item = formatForTailwindCSS(entry, vim_item)
        return vim_item
      end
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'emoji' },
      { name = "path" },
      { name = "luasnip" },
      { name = "vim-dadbod-completion" },
    },
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
  })
end

return M
