-- Extend LSP configuration
return {
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
}
