-- Add plugins, the packer syntax without the "use"
return {

  -- disable default plugins
  ["folke/which-key.nvim"] = {
    disable = true,
  },

  -- motion
  { "mg979/vim-visual-multi" },

  { "tpope/vim-repeat" },

  { "tpope/vim-surround" },

  -- git
  { "tpope/vim-fugitive" },

  ["sindrets/diffview.nvim"] = {
    after = "plenary.nvim",
    requires = "nvim-lua/plenary.nvim",
  },

  ["akinsho/git-conflict.nvim"] = { tag = "*", config = function() require("git-conflict").setup() end },

  -- autocomplete
  ["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },

  ["tzachar/cmp-tabnine"] = {
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

  ["rafamadriz/friendly-snippets"] = { event = { nil } },

  -- lsp
  ["jose-elias-alvarez/typescript.nvim"] = {
    after = "mason-lspconfig.nvim",
    config = function()
      require("typescript").setup {
        server = astronvim.lsp.server_settings "tsserver",
      }
    end,
  },

  ["simrat39/rust-tools.nvim"] = {
    after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
    config = function()
      require("rust-tools").setup {
        server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
      }
    end,
  },

  -- enhancement
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  { "MattesGroeger/vim-bookmarks" },

  -- telescope

  ["tom-anders/telescope-vim-bookmarks.nvim"] = {
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "vim_bookmarks" end,
  },

  ["nvim-telescope/telescope-project.nvim"] = {
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "project" end,
  },

  ["nvim-telescope/telescope-live-grep-args.nvim"] = {
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "live_grep_args" end,
  },

  ["nvim-telescope/telescope-file-browser.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.file_browser",
    config = function() require("telescope").load_extension "file_browser" end,
  },

  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "media_files" end,
  },

  -- themes
  ["EdenEast/nightfox.nvim"] = {
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

  ["ellisonleao/gruvbox.nvim"] = {
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

  { "luisiacc/gruvbox-baby" },

  { "sainnhe/gruvbox-material" },

  { "sainnhe/everforest" },

  { "savq/melange" },
}
