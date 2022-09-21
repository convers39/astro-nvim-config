-- local actions = require "telescope.actions"
local config = {

  -- Set colorscheme
  -- colorscheme = "duskfox",
  -- colorscheme = "gruvbox",
  colorscheme = "everforest",
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

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = { virtual_text = true, underline = true },
}

return config
