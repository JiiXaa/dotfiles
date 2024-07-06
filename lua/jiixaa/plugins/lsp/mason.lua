return {
  "williamboman/mason.nvim",  -- Main Mason plugin for managing external tools
  dependencies = {
    "williamboman/mason-lspconfig.nvim",  -- Mason integration with LSPConfig
    "WhoIsSethDaniel/mason-tool-installer.nvim",  -- Tool installer for Mason
  },
  config = function()
    -- Import necessary Mason plugins
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- Enable Mason and configure UI icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Setup Mason LSPConfig with specified servers to ensure installed
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",  -- TypeScript server
        "html",  -- HTML server
        "cssls",  -- CSS server
        "tailwindcss",  -- Tailwind CSS server
        "svelte",  -- Svelte server
        "lua_ls",  -- Lua server
        "graphql",  -- GraphQL server
        "emmet_ls",  -- Emmet server for HTML/CSS
        "emmet_language_server",  -- Emmet language server (seems redundant with emmet_ls)
        "prismals",  -- Prisma server
        "pyright",  -- Python server
      },
    })

    -- Setup Mason Tool Installer with specified tools to ensure installed
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",  -- Prettier formatter
        "stylua",  -- Lua formatter
        "isort",  -- Python import sorter
        "black",  -- Python formatter
        "pylint",  -- Python linter
        "eslint_d",  -- ESLint daemon
      },
    })
  end,
}
