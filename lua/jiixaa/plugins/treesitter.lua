return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Automatically run `:TSUpdate` after installation
    event = { "BufReadPost", "BufNewFile" },  -- Load treesitter on buffer read/new file
    lazy = vim.fn.argc(-1) == 0,  -- Lazy load if no files are specified on the command line

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",  -- Additional text objects via treesitter
      "nvim-treesitter/playground",  -- Interactive treesitter playground
      "windwp/nvim-ts-autotag",  -- Autotag support for HTML-like languages
    },

    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        ensure_installed = {  -- Languages to be installed by treesitter
          "typescript",
          "javascript",
          "lua",
          "fish",
          "go",
          "gomod",
          "html",
          "css",
          "xml",
          "rust",
          "toml",
          "yaml",
          "bash",
          "dockerfile",
          "sql",
          "json",
          "comment",
          "regex",
          "query",
        },
        highlight = {
          enable = true,  -- Enable highlighting
          additional_vim_regex_highlighting = false,  -- Disable additional regex highlighting
        },
        indent = {
          enable = true,  -- Enable indentation
        },
        incremental_selection = {
          enable = true,  -- Enable incremental selection
          keymaps = {  -- Keymaps for incremental selection
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
          },
        },
        textobjects = {
          select = {
            enable = true,  -- Enable text object selection
            lookahead = true,  -- Automatically jump forward to textobj
            keymaps = {  -- Keymaps for text object selection
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,  -- Enable moving to next/previous text objects
            set_jumps = true,  -- Set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          swap = {
            enable = true,  -- Enable swapping of text objects
            swap_next = {
              ["<leader>s"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>S"] = "@parameter.inner",
            },
          },
        },
        playground = {
          enable = true,  -- Enable playground
          disable = {},
          updatetime = 25,  -- Time for highlighting nodes in the playground from source code
          persist_queries = false,  -- Whether the query persists across vim sessions
          keybindings = {  -- Keybindings for playground
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })

      -- Add a custom parser for Blade templates
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",  -- URL for the Blade parser
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",  -- Filetype for Blade templates
      }

      -- Add filetype detection for Blade templates
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      -- Ensure nvim-ts-autotag is set up correctly
      require("nvim-ts-autotag").setup({
        filetypes = {  -- Filetypes for autotag
          "html",
          "xml",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "rescript",
        },
        skip_tags = {  -- Tags to skip for autotag
          "area",
          "base",
          "br",
          "col",
          "command",
          "embed",
          "hr",
          "img",
          "slot",
          "input",
          "keygen",
          "link",
          "meta",
          "param",
          "source",
          "track",
          "wbr",
          "menuitem",
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {},  -- Ensure nvim-ts-autotag is loaded with default options
  },
}
