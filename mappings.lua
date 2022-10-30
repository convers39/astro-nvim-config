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
    ["<A-t>"] = {
      function()
        local input = vim.fn.input "Buf number: "
        local num = tonumber(input, 10)
        if num == nil then
          return
        else
          require("bufferline").go_to_buffer(num, true)
        end
      end,
      desc = "Go to buffer by absolute number",
      noremap = true,
      silent = true,
    },
    ["<A-1>"] = { function() require("bufferline").go_to_buffer(1, false) end, noremap = true, silent = true },
    ["<A-2>"] = { function() require("bufferline").go_to_buffer(2, false) end, noremap = true, silent = true },
    ["<A-3>"] = { function() require("bufferline").go_to_buffer(3, false) end, noremap = true, silent = true },
    ["<A-4>"] = { function() require("bufferline").go_to_buffer(4, false) end, noremap = true, silent = true },
    ["<A-5>"] = { function() require("bufferline").go_to_buffer(5, false) end, noremap = true, silent = true },
    ["<A-6>"] = { function() require("bufferline").go_to_buffer(6, false) end, noremap = true, silent = true },
    ["<A-7>"] = { function() require("bufferline").go_to_buffer(7, false) end, noremap = true, silent = true },
    ["<A-8>"] = { function() require("bufferline").go_to_buffer(8, false) end, noremap = true, silent = true },
    ["<A-9>"] = { function() require("bufferline").go_to_buffer(9, false) end, noremap = true, silent = true },
    ["<A-0>"] = { function() require("bufferline").go_to_buffer(-1, false) end, noremap = true, silent = true },
    ["<A->>"] = { "<cmd>BufferLineMoveNext<CR>", noremap = true, silent = true },
    ["<A-<>"] = { "<cmd>BufferLineMovePrev<CR>", noremap = true, silent = true },

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
    ["<leader>tn"] = { function() toggle_term_cmd "node-prototype-repl" end, desc = "ToggleTerm node" },
    -- ["<leader>tu"] = { function() toggle_term_cmd "gdu" end, desc = "ToggleTerm gdu" },
    ["<leader>tp"] = { function() toggle_term_cmd "ipython" end, desc = "ToggleTerm python" },
    ["<leader>tb"] = { function() toggle_term_cmd "btop" end, desc = "ToggleTerm btm" },
    ["<leader>tc"] = { function() toggle_term_cmd "navi" end, desc = "ToggleTerm navi" },
    ["<leader>tl"] = false,
    ["<leader>tf"] = false,
    ["<leader>th"] = false,
    ["<leader>tv"] = false,

    -- close buffer
    ["<leader>C"] = {
      '<cmd>sil! exe "wa|%bd|e#|bd#|normal `"<cr>"',
      desc = "Save and close other buffers",
    },
    ["<leader>bo"] = {
      '<cmd>sil! exe "%bd|e#|bd#|normal `"<cr>"',
      desc = "Close other buffers except unsaved",
    },

    -- Aerial
    ["<C-b>"] = { "<cmd>AerialToggle<cr>" },

    -- trouble
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", noremap = true, silent = true },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", noremap = true, silent = true },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", noremap = true, silent = true },
    ["<leader>xr"] = { "<cmd>TroubleToggle lsp_references<cr>", noremap = true, silent = true },
    ["gxj"] = {
      function() require("trouble").next { skip_groups = true, jump = true } end,
      noremap = true,
      silent = true,
    },
    ["gxk"] = {
      function() require("trouble").previous { skip_groups = true, jump = true } end,
      noremap = true,
      silent = true,
    },
    ["gxf"] = {
      function() require("trouble").first { skip_groups = true, jump = true } end,
      noremap = true,
      silent = true,
    },
    ["gxl"] = {
      function() require("trouble").last { skip_groups = true, jump = true } end,
      noremap = true,
      silent = true,
    },

    -- git diff vieww
    ["gdo"] = { "<cmd>DiffviewOpen<CR>" },
    ["gdc"] = { "<cmd>DiffviewClose<CR>" },
    ["gdf"] = { "<cmd>DiffviewFileHistory<CR>" },

    -- git conflict
    ["gco"] = { "<cmd>GitConflictChooseOurs<CR>" },
    ["gct"] = { "<cmd>GitConflictChooseTheirs<CR>" },
    ["gcb"] = { "<cmd>GitConflictChooseBoth<CR>" },
    ["gcn"] = { "<cmd>GitConflictChooseNone<CR>" },
    ["gcj"] = { "<cmd>GitConflictNextConflict<CR>" },
    ["gck"] = { "<cmd>GitConflictPrevConflict<CR>" },
    ["gcq"] = { "<cmd>GitConflictListQf<CR>" },

    -- gitsigns
    ["ghj"] = { function() require("gitsigns").next_hunk() end, desc = "Next git hunk" },
    ["ghk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" },
    ["gbl"] = { function() require("gitsigns").blame_line() end, desc = "View git blame" },
    ["ghp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview git hunk" },
    ["ghr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" },
    ["ghs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage git hunk" },
    ["ghu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage git hunk" },
    ["gbr"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset git buffer" },
    -- ["gd"] = { function() require("gitsigns").diffthis() end, desc = "View git diff" },

    -- docs
    -- ["ng"] = { "<cmd>lua require('neogen').generate()<cr>", noremap = true },
    ["<leader>dd"] = { "<cmd>DogeGenerate<cr>", desc = "Generate documentation template" },

    -- code runner
    ["<leader>r"] = { "<cmd>SnipRun<cr>" },

    -- telescope
    -- ["<leader>tc"] = { "<cmd> Cheatsheet <CR>", desc = "Show cheatsheet" },
    ["<leader><leader>"] = {
      "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
      noremap = true,
      silent = true,
    },
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
    ["<leader>fb"] = {
      function()
        require("telescope.builtin").buffers {
          sort_mru = true,
          ignore_current_buffer = true,
        }
      end,
      desc = "Find buffers in mru order",
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
    [";"] = { ":", nowait = true },
    ["J"] = { ":move '>+1<CR>gv-gv", desc = "Move lines of code up" },
    ["K"] = { ":move '<-2<CR>gv-gv", desc = "Move lines of code down" },
    -- code runner
    ["<leader>r"] = { "<cmd>SnipRun<cr>" },
    -- gitsigns
    ["ghr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" },
    ["ghs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage git hunk" },
  },
  i = {
    ["<C-h>"] = { "<ESC>I", desc = "Insert to the first char of current line" },
    ["<C-l>"] = { "<ESC>A", desc = "Insert to the last char of current line" },
  },
  t = {
    ["<A-n>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    -- resize
    ["<A-l>"] = { "<C-\\><C-n>:vertical resize +5<CR>" },
    ["<A-h>"] = { "<C-\\><C-n>:vertical resize -5<CR>" },
    ["<A-j>"] = { "<C-\\><C-n>:resize -5<CR>" },
    ["<A-k>"] = { "<C-\\><C-n>:resize +5<CR>" },
    -- toggle
    ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "toggle floating terminal" },
    ["<A-H>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "toggle horizontal terminal" },
    ["<A-V>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "toggle vertical terminal" },
  },
}
