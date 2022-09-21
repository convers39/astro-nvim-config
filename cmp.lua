-- CMP Source Priorities
-- modify here the priorities of default cmp sources
-- higher value == higher priority
-- The value can also be set to a boolean for disabling default sources:
-- false == disabled
-- true == 1000

local icons = {
  Namespace = "",
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = " ",
  Field = "ﰠ ",
  Variable = " ",
  Class = "ﴯ ",
  Interface = " ",
  Module = " ",
  Property = "ﰠ ",
  Unit = "塞 ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = "פּ ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
  Table = "",
  Object = " ",
  Tag = "",
  Array = "[]",
  Boolean = " ",
  Number = " ",
  Null = "ﳠ",
  String = " ",
  Calendar = "",
  Watch = " ",
  Package = "",
}
return {
  source_priority = {
    nvim_lsp = 1000,
    cmp_tabnine = 900,
    nvim_lua = 800,
    luasnip = 700,
    buffer = 500,
    path = 250,
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(_, vim_item)
      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
      return vim_item
    end,
  },
}

-- local function has_words_before()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
-- end
-- local kind_icons = {
--   Text = "",
--   Method = "",
--   Function = "",
--   Constructor = "",
--   Field = "ﰠ",
--   Variable = "",
--   Class = "",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "פּ",
--   Event = "",
--   Operator = "",
--   TypeParameter = "",
-- }
--
-- local cmp = require "cmp"
-- local luasnip = require "luasnip"
--
-- return {
--   view = {
--     entries = { name = "custom", selection_order = "near_cursor" },
--   },
--   window = {
--     documentation = {
--       -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
--       border = { " ", " ", " ", " ", " ", " ", " ", " " },
--     },
--   },
--   formatting = {
--     fields = { "abbr", "kind", "menu" },
--     format = function(entry, vim_item)
--       local shorten_abbr = string.sub(vim_item.abbr, 1, 30)
--       if shorten_abbr ~= vim_item.abbr then vim_item.abbr = shorten_abbr .. "..." end
--       -- Kind icons
--       vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
--       -- Source
--       vim_item.menu = ({
--         buffer = "[Buf]",
--         nvim_lsp = "[LSP]",
--         luasnip = "[LuaSnip]",
--         nvim_lua = "[API]",
--         latex_symbols = "[LaTeX]",
--         cmp_tabnine = "[Tabnine]",
--         path = "[Path]",
--         emoji = "[Emoji]",
--       })[entry.source.name]
--       return vim_item
--     end,
--   },
--   sources = {
--     { name = "luasnip" },
--     { name = "nvim_lua" },
--     { name = "nvim_lsp" },
--     { name = "buffer" },
--     { name = "nvim_lua" },
--     { name = "path" },
--   },
--   source_priority = {
--     nvim_lsp = 1000,
--     cmp_tabnine = 900,
--     nvim_lua = 800,
--     luasnip = 700,
--     buffer = 500,
--     path = 250,
--   },
--   mapping = {
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_locally_jumpable() then
--         luasnip.expand_or_jump()
--       elseif has_words_before() then
--         cmp.complete()
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--     }),
--     ["<C-j>"] = cmp.config.disable,
--     ["<C-k>"] = cmp.config.disable,
--   },
-- }
