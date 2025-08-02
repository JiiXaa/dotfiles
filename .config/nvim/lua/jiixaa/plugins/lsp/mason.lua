return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "css_variables",
        "eslint",
        "ts_ls",
        "jsonls",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "emmet_language_server",
        "prismals",
        "pyright",
        "gopls",
        "rust_analyzer",
      },
      automatic_enable = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        -- "isort",
        -- "black",
        -- "pylint",
        "eslint",
        "codelldb",
      },
    })
  end,
}
