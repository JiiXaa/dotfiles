return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" }, -- ✅ globalne ładowanie
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatters for Go
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,
        -- Diagnostics for Go
        null_ls.builtins.diagnostics.golangci_lint,
      },
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
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
