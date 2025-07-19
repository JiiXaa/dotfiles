return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end,
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      config = function()
        require("tailwindcss-colorizer-cmp").setup({
          color_square_width = 2,
        })
      end,
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Up>"] = function(fallback)
          if cmp.visible() then
            cmp.close()
            fallback()
          else
            fallback()
          end
        end,
        ["<Down>"] = function(fallback)
          if cmp.visible() then
            cmp.close()
            fallback()
          else
            fallback()
          end
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp", group_index = 1 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "path", group_index = 2 },
      }),
      formatting = {

        expandable_indicator = true,
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          -- Use lspkind for icons
          item = lspkind.cmp_format({
            mode = "symbol_text", -- show symbol + text
            maxwidth = 50,
            ellipsis_char = "...",
            before = function(entry, vim_item)
              -- Set the expandable indicator
              vim_item.menu = ({
                copilot = "[Copilot]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
              })[entry.source.name]
              return vim_item
            end,
          })(entry, item)

          -- Add TailwindCSS colorizer
          item = require("tailwindcss-colorizer-cmp").formatter(entry, item)
          return item
        end,
      },
    })
  end,
}
