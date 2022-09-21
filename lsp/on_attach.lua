return function(client)
  if vim.tbl_contains({
    "solargraph",
    "gopls",
    "sqls",
  }, client.name) then
    astronvim.lsp.disable_formatting(client)
  end
end
