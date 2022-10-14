return {
  format_on_save = true, -- enable or disable automatic formatting on save
  timeout_ms = 1000, -- adjust the timeout_ms variable for formatting
  -- disabled = { "sumneko_lua" },
  -- filter = function(client)
  -- only enable null-ls for javascript files
  -- if vim.bo.filetype == "javascript" then
  --   return client.name == "null-ls"
  -- end

  -- enable all other clients
  --   return true
  -- end,
}
