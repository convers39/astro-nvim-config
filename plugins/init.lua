-- Add plugins, the packer syntax without the "use"
return {
  { "mg979/vim-visual-multi" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" },
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
  { "akinsho/git-conflict.nvim", tag = "*", config = function() require("git-conflict").setup() end },
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
    "nvim-telescope/telescope-file-browser.nvim",
    after = "telescope.nvim",
    module = "telescope._extensions.file_browser",
    config = function() require("telescope").load_extension "file_browser" end,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "media_files" end,
  },
  {
    "tzachar/cmp-tabnine",
    requires = "hrsh7th/nvim-cmp",
    run = "./install.sh",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = "..",
        ignored_file_types = {},
        show_prediction_strength = false,
      }
      require("core.utils").add_cmp_source { name = "cmp_tabnine", priority = 1000, max_item_count = 7 }
    end,
  },
  -- themes
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
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup {
        constrast = "soft",
        transparent_mode = true,
        overrides = {
          StatusLine = { bg = "#282828" },
        },
      }
    end,
  },
  { "sainnhe/everforest" },
  -- { "andweeb/presence.nvim" },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
