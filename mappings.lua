local toggle_term_cmd = astronvim.toggle_term_cmd

return {
  n = {
    -- NOTE: conflict with split
    -- ["<C-s>"] = {":w!<CR>"},
    ["<ESC>"] = { "<cmd>nohl<cr>", desc = "No highlight" },
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
    ["<A-v>"] = { "<C-w>v", desc = "Split window vertically" },
    ["<A-s>"] = { "<C-w>s", desc = "Split window horizontally" },

    -- multi-cursor
    ["<A-K>"] = { "<cmd>call vm#commands#add_cursor_up(0, v:count1)<cr>" },
    ["<A-J>"] = { "<cmd>call vm#commands#add_cursor_down(0, v:count1)<cr>" },

    -- terminal
    ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
    ["<A-H>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
    ["<A-V>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Toggle vertical terminal" },
    -- ["<leader>gg"] = { function() toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" },
    -- ["<leader>tn"] = { function() toggle_term_cmd "node" end, desc = "ToggleTerm node" },
    -- ["<leader>tu"] = { function() toggle_term_cmd "gdu" end, desc = "ToggleTerm gdu" },
    ["<leader>tp"] = { function() toggle_term_cmd "python3" end, desc = "ToggleTerm python" },
    ["<leader>tb"] = { function() toggle_term_cmd "btop" end, desc = "ToggleTerm btm" },
    ["<leader>tl"] = false,
    ["<leader>tf"] = false,
    ["<leader>th"] = false,
    ["<leader>tv"] = false,

    -- Aerial
    ["<C-b>"] = { "<cmd>:AerialToggle<cr>" },

    -- git diff view
    ["<leader>do"] = { "<cmd> DiffviewOpen <CR>" },
    ["<leader>dc"] = { "<cmd> DiffviewClose <CR>" },
    ["<leader>df"] = { "<cmd> DiffviewFileHistory <CR>" },

    -- TODO: session manager

    -- docs
    -- ["ng"] = { "<cmd>lua require('neogen').generate()<cr>", noremap = true },
    ["<leader>dd"] = { "<cmd>DogeGenerate<cr>" },

    -- telescope
    ["<leader>tc"] = { "<cmd> Cheatsheet <CR>", desc = "Show cheatsheet" },
    ["<leader>td"] = { "<cmd> TodoTelescope <CR>", desc = "Show todo items" },
    ["<leader>pj"] = { "<cmd> Telescope project <CR>", desc = "Show projects" },
    ["<leader>ma"] = {
      function() require("telescope").extensions.vim_bookmarks.all() end,
      desc = "Show all bookmarks",
    },
    ["<leader>mc"] = {
      function() require("telescope").extensions.vim_bookmarks.current_file() end,
      desc = "Show current file bookmarks",
    },
    ["<leader>tt"] = { "<cmd> Telescope colorscheme <CR>", desc = "Show colorscheme picker" },
    ["<leader>fs"] = {
      "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
      desc = "Telescope file browser",
    },
    ["<leader>fw"] = {
      "<cmd>lua require 'telescope'.extensions.live_grep_args.live_grep_args()<CR>",
      desc = "Search word with args",
    },
    ["<leader>fd"] = {
      function() require("telescope.builtin").lsp_document_symbols() end,
      desc = "Find symbols in current file",
    },
    ["<leader>ss"] = {
      function() require("telescope.builtin").grep_string() end,
      desc = "Search current word on cursor",
    },
    ["<leader>;"] = {
      function() require("telescope.builtin").current_buffer_fuzzy_find() end,
      desc = "Fuzzy find lines",
    },
  },
  v = {
    ["J"] = { ":move '>+1<CR>gv-gv", desc = "Move lines of code up" },
    ["K"] = { ":move '<-2<CR>gv-gv", desc = "Move lines of code down" },
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
