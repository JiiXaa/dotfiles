return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    -- Configure sources
    null_ls.setup({
      sources = {
        -- Go-specific formatters and linters
        null_ls.builtins.formatting.goimports, -- Formats and organizes imports
        null_ls.builtins.formatting.gofumpt, -- Opinionated code formatting
        null_ls.builtins.diagnostics.golangci_lint, -- Runs golangci-lint
      },
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          -- Auto-format on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
