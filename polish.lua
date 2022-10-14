-- This function is run last
-- good place to configure mappings and vim options
return function()
  local set = vim.opt
  -- Set options
  set.relativenumber = true
  set.foldlevel = 99

  set.foldexpr = "nvim_treesitter#foldexpr()"
  -- set.foldmethod = "indent"
  set.fillchars = { eob = "-", fold = " " }
  -- set.tm = 1000

  -- Set autocommands
  vim.api.nvim_create_augroup("packer_conf", {})
  vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Sync packer after modifying plugins.lua",
    group = "packer_conf",
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
  })

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
