return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Keybindings when LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references", unpack(opts) })
        keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", unpack(opts) })
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions", unpack(opts) })
        keymap.set(
          "n",
          "gi",
          "<cmd>Telescope lsp_implementations<CR>",
          { desc = "Show LSP implementations", unpack(opts) }
        )
        keymap.set(
          "n",
          "gt",
          "<cmd>Telescope lsp_type_definitions<CR>",
          { desc = "Show LSP type definitions", unpack(opts) }
        )
        keymap.set(
          { "n", "v" },
          "<leader>ca",
          vim.lsp.buf.code_action,
          { desc = "See available code actions", unpack(opts) }
        )
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", unpack(opts) })
        keymap.set(
          "n",
          "<leader>fD",
          "<cmd>Telescope diagnostics bufnr=0<CR>",
          { desc = "Show buffer diagnostics", unpack(opts) }
        )
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics", unpack(opts) })
        keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", unpack(opts) })
        keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", unpack(opts) })
        keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation", unpack(opts) })
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", unpack(opts) })
      end,
    })

    -- Configure diagnostics UI (signs, text, underline)
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "󰠠",
        },
        numhl = {},
      },
      underline = true,
      virtual_text = {
        prefix = "●",
      },
      severity_sort = true,
      update_in_insert = false,
    })

    -- Global config for all LSPs
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Per-server configs
    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          analyses = { unusedparams = true, shadow = true },
          staticcheck = true,
        },
      },
    })

    vim.lsp.config("rust_analyzer", {
      on_attach = function(client, bufnr)
        -- Enable autoformat on save for Rust
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end,
          })
        end
      end,
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true, -- support for feature flags in Cargo.toml
          },
          check = {
            command = "clippy", -- use clippy for inline diagnostics
          },
        },
      },
    })

    vim.lsp.config("cssls", {
      settings = {
        css = { lint = { unknownAtRules = "ignore" } },
        scss = { lint = { unknownAtRules = "ignore" } },
        less = { lint = { unknownAtRules = "ignore" } },
      },
      filetypes = { "css", "scss", "less" },
    })

    vim.lsp.config("tailwindcss", {
      filetypes = {
        "html",
        "css",
        "scss",
        "sass",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
      },
    })

    vim.lsp.config("svelte", {
      on_attach = function(client)
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
    })

    vim.lsp.config("graphql", {
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    vim.lsp.config("emmet_ls", {
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
      },
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
              "${3rd}/busted/library",
            },
          },
          telemetry = { enable = false },
          completion = { callSnippet = "Replace" },
        },
      },
    })
  end,
}
