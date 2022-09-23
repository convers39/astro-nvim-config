return {
  n = {
    -- ["<C-s>"] = {":w!<CR>"},
    [";"] = { ":", nowait = true },
    -- resize
    ["<A-l>"] = { ":vertical resize +2<CR>" },
    ["<A-h>"] = { ":vertical resize -2<CR>" },
    ["<A-j>"] = { ":resize -2<CR>" },
    ["<A-k>"] = { ":resize +2<CR>" },
    ["<A-=>"] = { "<C-w>=", desc = "Resize equal" },

    -- navigation
    ["<C-u>"] = { "10k", desc = "Move up 10 lines" },
    ["<C-d>"] = { "10j", desc = "Move down 10 lines" },
    -- split
    ["<C-v>"] = { "<C-w>v", desc = "Split window vertically" },
    ["<C-s>"] = { "<C-w>s", desc = "Split window horizontally" },

    -- terminal
    ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "toggle floating terminal" },
    ["<A-H>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "toggle horizontal terminal" },
    ["<A-V>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "toggle vertical terminal" },
    -- git diff view
    ["<leader>do"] = { "<cmd> DiffviewOpen <CR>" },
    ["<leader>dc"] = { "<cmd> DiffviewClose <CR>" },
    ["<leader>df"] = { "<cmd> DiffviewFileHistory <CR>" },
    -- telescope
    ["<leader>td"] = { "<cmd> TodoTelescope <CR>", desc = "Show todo items" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", desc = "Show keymaps" },
    ["<leader>tp"] = { "<cmd> Telescope project <CR>", desc = "Showl projects" },
    ["<leader>ma"] = {
      function() require("telescope").extensions.vim_bookmarks.all() end,
      desc = "Show all bookmarks",
    },
    ["<leader>mc"] = {
      function() require("telescope").extensions.vim_bookmarks.current_file() end,
      desc = "Show current file bookmarks",
    },
    ["<leader>tt"] = { "<cmd> Telescope colorscheme <CR>", desc = "Show colorscheme picker" },

    ["<leader>tf"] = {
      "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
      desc = "Telescope file browser",
      noremap = true,
    },
  },
  v = {
    ["J"] = { ":move '>+1{<CR>gv-gv", desc = "Move lines of code up" },
    ["K"] = { ":move '<-2{<CR>gv-gv", desc = "Move lines of code down" },
  },
  i = {
    ["<C-h>"] = { "<ESC>I", desc = "Insert to the first char of current line" },
    ["<C-l>"] = { "<ESC>A", desc = "Insert to the last char of current line" },
  },
  t = {
    ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "toggle floating terminal" },
    ["<A-H>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "toggle horizontal terminal" },
    ["<A-V>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "toggle vertical terminal" },
  },
}
