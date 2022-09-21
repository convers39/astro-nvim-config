-- This function is run last
-- good place to configure mappings and vim options
return function()
  local map = vim.keymap.set
  local set = vim.opt
  -- Set options
  set.relativenumber = true
  set.foldlevel = 99
  vim.o.background = "dark"
  -- vim.cmd([[colorscheme gruvbox]])

  -- Set key bindings
  local opt = { noremap = true, silent = true }
  map("n", "<C-s>", ":w!<CR>")
  map("n", "<M-Up>", require("smart-splits").resize_up)
  map("n", "<M-Down>", require("smart-splits").resize_down)
  map("n", "<M-Left>", require("smart-splits").resize_left)
  map("n", "<M-Right>", require("smart-splits").resize_right)
  map("n", ";", ":", { nowait = true })
  -- resize
  map("n", "<A-Right>", ":vertical resize +2<CR>")
  map("n", "<A-Left>", ":vertical resize -2<CR>")
  map("n", "<A-Down>", ":resize -2<CR>")
  map("n", "<A-Up>", ":resize +2<CR>")
  map("n", "<A-=>", "<C-w>=")
  -- navigation
  map("n", "<A-h>", "<C-w>h")
  map("n", "<A-j>", "<C-w>j")
  map("n", "<A-k>", "<C-w>k")
  map("n", "<A-l>", "<C-w>l")
  map("n", "<A-q>", "<C-w>q")
  map("n", "<C-u>", "10k")
  map("n", "<C-d>", "10j")

  map("t", "<A-j>", [[<C-\><C-N><C-w>j]])
  map("t", "<A-k>", [[<C-\><C-N><C-w>k]])
  map("t", "<A-l>", [[<C-\><C-N><C-w>l]])
  map("t", "<A-q>", [[<C-\><C-N><C-w>q]])
  -- split
  map("n", "<A-v>", "<C-w>v")
  map("n", "<A-s>", "<C-w>s")
  -- edit
  map("i", "<C-h>", "<ESC>I")
  map("i", "<C-l>", "<ESC>A")
  map("v", "J", ":move '>+1<CR>gv-gv")
  map("v", "K", ":move '<-2<CR>gv-gv")
  map("n", "<leader>td", "<cmd> TodoTelescope <CR>")
  map("n", "<leader>tk", "<cmd> Telescope keymaps <CR>")
  map("n", "<leader>tp", "<cmd> Telescope project <CR>")
  map("n", "<leader>do", "<cmd> DiffviewOpen <CR>")
  map("n", "<leader>dc", "<cmd> DiffviewClose <CR>")
  map("n", "<leader>df", "<cmd> DiffviewFileHistory <CR>")
  map("n", "<leader>ma", function() require("telescope").extensions.vim_bookmarks.all() end, {
    desc = "Show all bookmarks",
  })
  map("n", "<leader>mc", function() require("telescope").extensions.vim_bookmarks.current_file() end, {
    desc = "Show current file bookmarks",
  })
  map(
    "n",
    "<leader>fs",
    "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
    { noremap = true, desc = "Telescope file browser" }
  )

  -- Set autocommands
  vim.api.nvim_create_augroup("packer_conf", {})
  vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Sync packer after modifying plugins.lua",
    group = "packer_conf",
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
  })

  -- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  vim.opt.foldmethod = "indent"
  vim.opt.fillchars = { eob = "-", fold = " " }
  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }
end
