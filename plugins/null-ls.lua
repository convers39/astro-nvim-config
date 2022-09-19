-- null-ls configuration
return function(config)
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
end
