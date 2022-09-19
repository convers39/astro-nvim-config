-- local actions = require "telescope.actions"
local config = {

  -- Set colorscheme
  --[[ colorscheme = "duskfox", ]]
  colorscheme = "gruvbox",
  -- colorscheme = "catppuccin",
  -- colorscheme = "sonokai",
  -- colorscheme = "default_theme",

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = { fg = "#abb2bf" },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  -- Disable AstroNvim ui feature
  ui = { nui_input = true, telescope_select = true },
  -- Configure plugins
  plugins = {
    -- null-ls configuration
    ["null-ls"] = function(config)
      -- Formatting and linting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim
      -- local status_ok, null_ls = pcall(require, "null-ls")
      -- if not status_ok then
      --   return
      -- end
      local null_ls = require "null-ls"

      -- Check supported formatters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting

      -- Check supported linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local diagnostics = null_ls.builtins.diagnostics
      local code_actions = null_ls.builtins.code_actions
      config.sources = {
        -- Set a formatter
        formatting.prettier,
        formatting.rustfmt,
        formatting.stylua,
        formatting.autopep8,
        -- formatting.black,
        -- Set a linter
        diagnostics.flake8,
        diagnostics.mypy,
        -- diagnostics.cspell,
        diagnostics.eslint,
        code_actions.refactoring,
        code_actions.eslint,
        code_actions.gitsigns,
      }

      -- NOTE: You can remove this on attach function to disable format on save
      config.on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config
      -- null_ls.setup {
      --   debug = false,
      -- }
    end,
    -- Add plugins, the packer syntax without the "use"
    init = {
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
        config = function() require("telescope").load_extension "vim_bookmarks" end,
      },
      { "tom-anders/telescope-vim-bookmarks.nvim" },
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
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
      },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
    telescope = {
      defaults = {
        mappings = {
          i = {
            -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            -- ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
        prompt_prefix = " 🔭 ",
        selection_caret = "❯ ",
        path_display = { "truncate" },
        file_ignore_patterns = { "node_modules", ".git" },
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
      pickers = { find_files = { hidden = true } },
      extensions = {
        vim_bookmarks = {},
      },
    },
    ["neo-tree"] = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = false,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 0,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          with_expanders = false,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        name = { trailing_slash = false, use_git_status_colors = true },
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["o"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["C"] = "close_node",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["R"] = "refresh",
          ["/"] = "fuzzy_finder",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
        },
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
            "thumbs.db",
            "node_modules",
            "__pycache__",
          },
        },
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
      buffers = {
        show_unloaded = true,
        window = { mappings = { ["bd"] = "buffer_delete" } },
      },
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
      },
      event_handlers = {
        {
          event = "vim_buffer_enter",
          handler = function(_)
            if vim.bo.filetype == "neo-tree" then vim.wo.signcolumn = "auto" end
          end,
        },
      },
    },
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = { vscode_snippet_paths = { "./lua/user/snippets" } },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   server:setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
    mappings = {
      n = {
        gi = function() require("telescope.builtin").lsp_implementations() end,
        gr = function() require("telescope.builtin").lsp_references() end,
        gd = function() require("telescope.builtin").lsp_definitions() end,
      },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = { virtual_text = true, underline = true },

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
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
    map("n", "<leader>ma", function() require("telescope").extensions.vim_bookmarks.all() end, {
      desc = "Show Bookmarks",
    })
    map("n", "<leader>mc", function() require("telescope").extensions.vim_bookmarks.current_file() end, {
      desc = "Show Bookmarks",
    })

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
  end,
}

return config
