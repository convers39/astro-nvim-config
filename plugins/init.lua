-- Add plugins, the packer syntax without the "use"
return {
  { "mg979/vim-visual-multi" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    after = "plenary.nvim",
    requires = "nvim-lua/plenary.nvim",
  },
  {
    "MattesGroeger/vim-bookmarks",
  },
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "vim_bookmarks" end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "project" end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup {
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      }
    end,
  },
  { "ellisonleao/gruvbox.nvim" },
  -- { "andweeb/presence.nvim" },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
