-- Add plugins, the packer syntax without the "use"
return {

  -- disable default plugins
  ["folke/which-key.nvim"] = {
    disable = true,
  },

  -- motion & edit
  { "mg979/vim-visual-multi" },

  { "tpope/vim-repeat" },

  -- { "tpope/vim-surround" },
  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  { "ggandor/lightspeed.nvim" },

  { "andymass/vim-matchup" },

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
    after = "nvim-cmp",
    run = "./install.sh",
    config = function()
      require("cmp_tabnine.config").setup {
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

  ["windwp/nvim-ts-autotag"] = {
    config = function() require("nvim-ts-autotag").setup() end,
  },

  ["simrat39/rust-tools.nvim"] = {
    after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
    config = function()
      require("rust-tools").setup {
        server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
      }
    end,
  },

  ["WhoIsSethDaniel/mason-tool-installer.nvim"] = {
    after = "mason.nvim",
    config = function() require("user.plugins.mason-tool-installer").setup() end,
  },

  ["ThePrimeagen/refactoring.nvim"] = {
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
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

  { "kkharji/sqlite.lua" },

  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { "kkharji/sqlite.lua", module = "sqlite" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function() require("neoclip").setup() end,
  },

  { "nacro90/numb.nvim" },

  {
    "michaelb/sniprun",
    run = "bash ./install.sh",
    config = function() require "user.plugins.sniprun" end,
  },

  -- docs
  {
    "kkoomen/vim-doge",
    run = ":call doge#install()",
    config = function() require("user.plugins.vim-doge-conf").setup() end,
    cmd = { "DogeGenerate", "DogeCreateDocStandard" },
  },

  -- ["danymat/neogen"] = {
  --   config = function() require("neogen").setup(require "user.plugins.neogen-conf") end,
  -- },

  -- ["sudormrfbin/cheatsheet.nvim"] = {
  --   requires = {
  --     { "nvim-telescope/telescope.nvim" },
  --     { "nvim-lua/popup.nvim" },
  --     { "nvim-lua/plenary.nvim" },
  --   },
  -- },

  -- ui
  ["tiagovla/scope.nvim"] = {
    config = function() require("scope").setup() end,
  },

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

  {
    "nvim-telescope/telescope-frecency.nvim",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "frecency" end,
    requires = { "kkharji/sqlite.lua" },
  },
  -- ["nvim-telescope/telescope-media-files.nvim"] = {
  --   after = "telescope.nvim",
  --   config = function() require("telescope").load_extension "media_files" end,
  -- },

  -- themes
  { "folke/tokyonight.nvim" },

  { "marko-cerovac/material.nvim" },

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
        contrast = "soft",
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
