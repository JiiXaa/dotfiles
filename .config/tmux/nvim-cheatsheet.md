# Nvim Cheatsheet

## Legend: Vim Modes

| Mode Key | Vim Mode Name      | Description                                                        |
| -------- | ------------------ | ------------------------------------------------------------------ |
| `n`      | Normal             | Default mode for navigation and commands                           |
| `i`      | Insert             | Insert text (typing mode)                                          |
| `v`      | Visual             | Select text using motions                                          |
| `x`      | Visual (character) | Visual mode for selecting characters (triggered with `v`)          |
| `s`      | Select             | Similar to Visual but for GUI selection (rarely used)              |
| `o`      | Operator-pending   | Waiting for a motion to complete an operator like `d`, `y`, or `c` |
| `c`      | Command-line       | Typing commands (e.g. `:` or `/`)                                  |

---

## Flash.nvim

### Key Mappings Summary

| Key Combo | Mode(s)       | Action                      | Description                                                     |
| --------- | ------------- | --------------------------- | --------------------------------------------------------------- |
| `f`/`F`   | `n`, `x`, `o` | Char jump forward/back      | Jump to single char with labels (forward = `f`, backward = `F`) |
| `t`/`T`   | `n`, `x`, `o` | Char till before jump       | Jump just before char (like `t`/`T` in Vim)                     |
| `;`       | `n`, `x`, `o` | Repeat forward jump         | Repeat last Flash jump forward                                  |
| `,`       | `n`, `x`, `o` | Repeat backward jump        | Repeat last Flash jump backward                                 |
| `m`       | `n`, `x`, `o` | `flash.jump()`              | Main Flash jump with labels                                     |
| `M`       | `n`, `x`, `o` | `flash.treesitter()`        | Jump to Treesitter nodes (functions, classes, etc.)             |
| `r`       | `o`           | `flash.remote()`            | Remote jump to another window (used with `d`, `y`, `c`, etc.)   |
| `R`       | `o`, `x`      | `flash.treesitter_search()` | Treesitter-aware motion (delete, yank, change, visual, etc.)    |
| `<C-f>`   | `c`           | `flash.toggle()`            | Toggle Flash-enhanced search in command-line mode               |

---

### Usage Examples

#### `f`, `F`, `t`, `T`

- `f=` → jump to next `=`
- `F(` → jump to previous `(`
- `t"` → jump till before next `"`
- `T{` → jump till before previous `{`

#### `;`, `,`

- After any Flash jump (e.g. `f=`, `m`, etc.):
  - `;` → repeat last jump forward
  - `,` → repeat last jump backward

#### `m` – Flash Jump

- Press `m` to activate jump mode
- Labels appear over jump targets
- Type the label to jump instantly

#### `M` – Flash Treesitter

- Press `M` to highlight Treesitter structures (functions, classes, etc.)
- Works only if a Treesitter parser is available for the current filetype

#### `r` – Remote Flash (Operator-Pending)

Used in combination with operators:

- `dr` → delete across windows using Flash
- `yr` → yank across splits
- `cr` → change using remote motion

#### `R` – Treesitter Search

Can be used in operator-pending or visual mode:

- `dR` → delete to a Treesitter node (e.g. entire function)
- `yR` → yank to a Treesitter node
- `cR` → change to a Treesitter node
- Visual mode + `R` → extend selection to whole node

#### `<C-f>` – Flash in Command Mode

- Press `<C-f>` during `/` or `:` to toggle Flash-powered search

---

## Substitute.nvim

### Key Mappings Summary

| Key Combo | Mode | Action                  | Description                        |
| --------- | ---- | ----------------------- | ---------------------------------- |
| `s`       | `n`  | `substitute.operator()` | Substitute with a motion           |
| `ss`      | `n`  | `substitute.line()`     | Substitute entire line             |
| `S`       | `n`  | `substitute.eol()`      | Substitute from cursor to line end |
| `s`       | `x`  | `substitute.visual()`   | Substitute in visual selection     |

### Usage Examples: Substitute.nvim

- `siw` → substitute inner word
- `ss` → substitute entire current line
- `S` → substitute from cursor to end of line
- Visual mode `v` select → `s` → replace selection

---

## Treesitter Textobjects

### Selection Keymaps

| Key Combo | Mode  | Textobject         | Description      |
| --------- | ----- | ------------------ | ---------------- |
| `aa`      | `x/o` | `@parameter.outer` | Around parameter |
| `ia`      | `x/o` | `@parameter.inner` | Inside parameter |
| `af`      | `x/o` | `@function.outer`  | Around function  |
| `if`      | `x/o` | `@function.inner`  | Inside function  |
| `ac`      | `x/o` | `@class.outer`     | Around class     |
| `ic`      | `x/o` | `@class.inner`     | Inside class     |

### Movement Keymaps

| Key Combo | Direction | Target         |
| --------- | --------- | -------------- |
| `]m`      | Next      | Function start |
| `]M`      | Next      | Function end   |
| `]]`      | Next      | Class start    |
| `][`      | Next      | Class end      |
| `[m`      | Previous  | Function start |
| `[M`      | Previous  | Function end   |
| `[[`      | Previous  | Class start    |
| `[]`      | Previous  | Class end      |

### Incremental Selection

| Key Combo   | Action                          |
| ----------- | ------------------------------- |
| `<C-Space>` | Init / Expand selection         |
| `<C-H>`     | Shrink selection (custom remap) |
| `<C-S>`     | Expand scope selection          |

---

## Comment.nvim

### Key Mappings Summary

| Key Combo | Mode(s) | Action         | Description                        |
| --------- | ------- | -------------- | ---------------------------------- |
| `gcc`     | `n`     | Toggle line    | Comment/uncomment current line     |
| `gbc`     | `n`     | Toggle block   | Block comment for current line     |
| `gc`      | `n/o`   | Operator line  | Comment with motion                |
| `gb`      | `n/o`   | Operator block | Block comment with motion          |
| `gcO`     | `n`     | Comment above  | Add comment on line above          |
| `gco`     | `n`     | Comment below  | Add comment on line below          |
| `gcA`     | `n`     | Comment at EOL | Add comment at end of current line |

---

## nvim-cmp

### Key Mappings Summary

| Key Combo | Mode(s) | Action                | Description                      |
| --------- | ------- | --------------------- | -------------------------------- |
| `<C-k>`   | `i`     | Select prev item      | Move to previous completion item |
| `<C-j>`   | `i`     | Select next item      | Move to next completion item     |
| `<C-b>`   | `i`     | Scroll docs up        | Scroll up in docs                |
| `<C-f>`   | `i`     | Scroll docs down      | Scroll down in docs              |
| `<Esc>`   | `i`     | Abort completion      | Cancel completion menu           |
| `<CR>`    | `i`     | Confirm selection     | Confirm selected item            |
| `<Up>`    | `i`     | Fallback to prev item | Select previous or fallback      |
| `<Down>`  | `i`     | Fallback to next item | Select next or fallback          |

---

## Gitsigns.nvim

### Navigation

| Key Combo | Mode | Action      | Description         |
| --------- | ---- | ----------- | ------------------- |
| `]h`      | `n`  | `next_hunk` | Go to next hunk     |
| `[h`      | `n`  | `prev_hunk` | Go to previous hunk |

### Actions

| Key Combo    | Mode     | Action              | Description                       |
| ------------ | -------- | ------------------- | --------------------------------- |
| `<leader>hs` | `n`, `v` | `stage_hunk`        | Stage current hunk                |
| `<leader>hr` | `n`, `v` | `reset_hunk`        | Reset current hunk                |
| `<leader>hS` | `n`      | `stage_buffer`      | Stage entire buffer               |
| `<leader>hR` | `n`      | `reset_buffer`      | Reset entire buffer               |
| `<leader>hu` | `n`      | `undo_stage_hunk`   | Undo stage hunk                   |
| `<leader>hp` | `n`      | `preview_hunk`      | Preview current hunk              |
| `<leader>hb` | `n`      | `blame_line`        | Git blame for current line        |
| `<leader>hB` | `n`      | `toggle_line_blame` | Toggle virtual text blame display |
| `<leader>hd` | `n`      | `diffthis`          | Git diff against index            |
| `<leader>hD` | `n`      | `diffthis('~')`     | Git diff against last commit      |

### Text Object

| Key Combo | Mode(s)  | Action        | Description         |
| --------- | -------- | ------------- | ------------------- |
| `ih`      | `o`, `x` | `select_hunk` | Select current hunk |

---

## Emmet.nvim

### Key Mappings Summary

| Key Combo    | Mode(s)  | Action                     | Description                                |
| ------------ | -------- | -------------------------- | ------------------------------------------ |
| `<leader>xe` | `n`, `v` | `wrap_with_abbreviation()` | Wrap selected text with Emmet abbreviation |

### Usage Example

In visual mode, select HTML code or a placeholder text, press `<leader>xe`, and then type an Emmet abbreviation (e.g. `ul>li*3`) to wrap the selection.

- Example:
  - Select: `Hello`
  - Trigger: `<leader>xe`
  - Input: `div.class`
  - Result: `<div class="class">Hello</div>`

---

## Neo-tree.nvim

### Key Mappings Summary

| Key Combo    | Mode | Action                      | Description                     |
| ------------ | ---- | --------------------------- | ------------------------------- |
| `<leader>ee` | `n`  | `Neotree toggle`            | Toggle Neo-tree                 |
| `<leader>ef` | `n`  | `Neotree reveal`            | Reveal current file in Neo-tree |
| `<leader>eb` | `n`  | `Neotree buffers toggle`    | Toggle Buffers view             |
| `<leader>eg` | `n`  | `Neotree git_status toggle` | Toggle Git Status view          |
| `<leader>er` | `n`  | `Neotree close + reveal`    | Soft refresh Neo-tree           |
| `<leader>ew` | `n`  | `Neotree focus`             | Focus Neo-tree                  |
| `<leader>eC` | `n`  | `Neotree close`             | Close Neo-tree                  |

### Notes

- Neo-tree provides a modern file explorer, buffer manager, and git status viewer.
- Git status and buffer view are toggled independently.
- `Soft refresh` (`<leader>er`) closes and reopens the file explorer to resync.

---

## Surround.nvim

### Key Mappings Summary

| Key Combo       | Mode(s) | Action                 | Description                                     |
| --------------- | ------- | ---------------------- | ----------------------------------------------- |
| `ys{motion}{c}` | `n`     | Add surround           | Surround text by motion (e.g. `ysiw"`)          |
| `yss{c}`        | `n`     | Add surround to line   | Surround entire line (e.g. `yss(`)              |
| `S{c}`          | `v`     | Add surround selection | Visual mode: surround selected text             |
| `ds{c}`         | `n`     | Delete surround        | Remove surrounding character (e.g. `ds'`)       |
| `cs{old}{new}`  | `n`     | Change surround        | Replace one surround with another (e.g. `cs"'`) |

### Usage Examples: Surround.nvim

#### Add Surround

- `ysiw"` → `"word"`
- `yss)` → `(whole line)`

#### Delete Surround

- `ds"` → removes `"` around word

#### Change Surround

- `cs"'` → changes `"word"` → `'word'`

#### Visual Mode

- Select text → press `S}` → wraps with `{}`

---

## Telescope.nvim

### Key Mappings Summary

| Key Combo    | Mode(s) | Action                   | Description                                           |
| ------------ | ------- | ------------------------ | ----------------------------------------------------- |
| `<leader>ff` | `n`     | `find_files`             | Fuzzy find files in current working directory         |
| `<leader>fr` | `n`     | `oldfiles`               | Fuzzy find recent files                               |
| `<leader>fs` | `n`     | `live_grep`              | Search for string in cwd                              |
| `<leader>fc` | `n`     | `grep_string`            | Search for string under cursor in cwd                 |
| `<leader>ft` | `n`     | `TodoTelescope`          | Search todos                                          |
| `<leader>fb` | `n`     | `buffers`                | List and switch buffers                               |
| `<leader>lr` | `n`     | `lsp_references`         | Find references (LSP)                                 |
| `gd`         | `n`     | `lsp_definitions`        | Go to definition (LSP)                                |
| `gi`         | `n`     | `lsp_implementations`    | Go to implementation (LSP)                            |
| `<leader>ld` | `n`     | `lsp_document_symbols`   | Search document symbols (LSP)                         |
| `<leader>lw` | `n`     | `lsp_workspace_symbols`  | Search workspace symbols (LSP)                        |
| `<leader>li` | `n`     | `lsp_incoming_calls`     | Find incoming calls (LSP)                             |
| `<leader>lo` | `n`     | `lsp_outgoing_calls`     | Find outgoing calls (LSP)                             |
| `<C-k>`      | `i`     | Move selection previous  | Move to previous search result in Telescope           |
| `<C-j>`      | `i`     | Move selection next      | Move to next search result in Telescope               |
| `<C-q>`      | `i`     | Send to qflist + Trouble | Send selected entries to quickfix and open in Trouble |
| `<C-t>`      | `i`     | Open in Trouble          | Open Telescope results directly in Trouble            |

### Usage Examples: Telescope.nvim

- `<leader>ff` → Search for a file in your project
- `<leader>fs` → Live grep for a term in your workspace
- `gd` → Jump to a definition using Telescope's LSP picker
- `<C-q>` in Telescope prompt → Send multiple selections to quickfix + open Trouble

---

## Todo-Comments.nvim

### Key Mappings Summary

| Key Combo        | Mode | Action           | Description                    |
| ---------------- | ---- | ---------------- | ------------------------------ |
| `]t`             | `n`  | `jump_next()`    | Jump to next TODO-like comment |
| `[t`             | `n`  | `jump_prev()`    | Jump to previous TODO comment  |
| `:TodoTelescope` | cmd  | Telescope picker | List/search TODOs in project   |
| `:TodoTrouble`   | cmd  | Trouble view     | Show TODOs in Trouble list     |
| `:TodoQuickFix`  | cmd  | Quickfix list    | Send TODOs to quickfix         |
| `:TodoLocList`   | cmd  | Location list    | Send TODOs to loclist          |

### Tag Types & Descriptions

- **`TODO:`** Task to be done / planned work.
- **`FIX:`** Bug to fix; something is broken or incorrect.
- **`HACK:`** Temporary workaround; non-ideal code to be revisited.
- **`PERF:`** Performance concern; optimize or improve efficiency.
- **`NOTE:`** Important note or context for future readers.
- **`WARNING:`** Potential issue or risky area (alias: `WARN:`).

> Tip: Tags are case-insensitive and can be configured; defaults include color/highlight per tag.

### Usage Examples

- Add a todo:  
  `-- TODO: handle edge cases for empty payload`

- Mark a bug:  
  `-- FIX: nil dereference when response is nil`

- Temporary workaround:  
  `-- HACK: force refresh until upstream issue is fixed`

- Performance note:  
  `-- PERF: avoid extra allocations in hot path`

- Quick navigation:
  - `]t` jumps to the next tag (`TODO`, `FIX`, `HACK`, `PERF`, `NOTE`, `WARNING`)
  - `[t` jumps to the previous tag

- Project-wide overview:
  - `:TodoTelescope` → fuzzy search & filter todos
  - `:TodoTrouble` → structured list with quick navigation

---

## Trouble.nvim

### Key Mappings Summary

| Key Combo    | Mode | Action / Command                                     | Description                               |
| ------------ | ---- | ---------------------------------------------------- | ----------------------------------------- |
| `<leader>xx` | `n`  | `:Trouble diagnostics toggle`                        | Open/close Trouble (Diagnostics)          |
| `<leader>xw` | `n`  | `:Trouble diagnostics toggle filter.scope=workspace` | Workspace diagnostics                     |
| `<leader>xd` | `n`  | `:Trouble diagnostics toggle filter.scope=document`  | Current-file diagnostics                  |
| `<leader>xq` | `n`  | `:Trouble qflist toggle`                             | Quickfix list in Trouble                  |
| `<leader>xl` | `n`  | `:Trouble loclist toggle`                            | Location list in Trouble                  |
| `<leader>xt` | `n`  | `:TodoTrouble`                                       | Show TODO/FIX/HACK/PERF/NOTE/WARNING tags |

### Usage Examples

- **Open diagnostics for current file**  
  `<leader>xd` → list issues only for the active buffer.

- **Open diagnostics for whole workspace**  
  `<leader>xw` → scan the project (LSP workspace) and list issues.

- **Review TODO-style comments**  
  `<leader>xt` → opens todo-comments in Trouble (filter, jump, fix).

- **Quickfix / Loclist integration**
  - `<leader>xq` → view items from `:copen` (quickfix) in Trouble.
  - `<leader>xl` → view items from `:lopen` (location list) in Trouble.

### Inside the Trouble list

- **Navigate**: use regular movement keys (`j`/`k`) to move the cursor.
- **Jump to item**: press `<CR>` on a list entry to jump to that location.
- **Close**: `q` (or re-run your toggle mapping like `<leader>xx`).

> Tip: Trouble supports additional sources (e.g., `:Trouble symbols`, `:Trouble lsp toggle`), but the mappings above cover your current workflow.

---

## Undotree

### **Description**

The `mbbill/undotree` plugin provides a visual representation of your undo history, allowing you to navigate and restore changes easily.

### **Keybindings**

| Mode | Key Combo   | Action           | Description                       |
| ---- | ----------- | ---------------- | --------------------------------- |
| `n`  | `<leader>u` | `UndotreeToggle` | Toggle the undo tree panel on/off |

### **Usage Notes**

- The undo tree panel opens in a split window showing all undo/redo branches.
- You can navigate between states in the undo history and restore them.
- Useful for tracking changes beyond simple linear undo/redo.

---

## Vim-Maximizer

### **Description**

The `szw/vim-maximizer` plugin allows you to maximize and restore the current split window in Neovim, making it easier to focus on one pane.

### **Keybindings**

| Mode | Key Combo | Action            | Description                        |
| ---- | --------- | ----------------- | ---------------------------------- |
| `n`  | `<C-w>m`  | `MaximizerToggle` | Toggle maximizing/restoring window |

### **Usage Notes**

- When toggled on, the current split will expand to fill the Neovim window.
- Press the same shortcut again to restore the previous layout.
- Works well with multiple splits to focus on one task.

---

## Vim-Visual-Multi

This plugin enables powerful **multicursor editing**

### Default Mappings (with default `VM_leader = \`)

| Action              | Default Keybinding |
| ------------------- | ------------------ |
| Find Under          | `<C-n>`            |
| Find Subword Under  | `<C-n>`            |
| Select All          | `\A`               |
| Start Regex Search  | `\/`               |
| Add Cursor Down     | `<C-Down>`         |
| Add Cursor Up       | `<C-Up>`           |
| Visual Regex        | `\/`               |
| Visual All          | `\A`               |
| Visual Add          | `\a`               |
| Visual Find         | `\f`               |
| Visual Cursors      | `\c`               |
| Switch Mode         | `<Tab>`            |
| Find Next           | `]`                |
| Find Prev           | `[`                |
| Goto Next           | `}`                |
| Goto Prev           | `{`                |
| Seek Next           | `<C-f>`            |
| Seek Prev           | `<C-b>`            |
| Skip Region         | `q`                |
| Remove Region       | `Q`                |
| Invert Direction    | `o`                |
| Find Operator       | `m`                |
| Surround            | `S`                |
| Replace Pattern     | `R`                |
| Tools Menu          | ``\```             |
| Show Registers      | `\"`               |
| Case Setting        | `\c`               |
| Toggle Whole Word   | `\w`               |
| Transpose           | `\t`               |
| Align               | `\a`               |
| Duplicate           | `\d`               |
| Rewrite Last Search | `\r`               |

---

## LSP (nvim-lspconfig)

### Attach-time Keymaps (buffer-local)

| Key Combo    | Mode  | Action                           | Description                       |
| ------------ | ----- | -------------------------------- | --------------------------------- |
| `gR`         | `n`   | `Telescope lsp_references`       | Show all references (Telescope)   |
| `gD`         | `n`   | `vim.lsp.buf.declaration()`      | Go to declaration                 |
| `gd`         | `n`   | `Telescope lsp_definitions`      | Show definitions (Telescope)      |
| `gi`         | `n`   | `Telescope lsp_implementations`  | Show implementations (Telescope)  |
| `gt`         | `n`   | `Telescope lsp_type_definitions` | Show type definitions (Telescope) |
| `<leader>ca` | `n/v` | `vim.lsp.buf.code_action()`      | Code actions (normal/visual)      |
| `<leader>rn` | `n`   | `vim.lsp.buf.rename()`           | Smart rename                      |
| `K`          | `n`   | `vim.lsp.buf.hover()`            | Hover docs                        |
| `<leader>rs` | `n`   | `:LspRestart`                    | Restart LSP server                |

### Diagnostics

| Key Combo    | Mode | Action                          | Description                         |
| ------------ | ---- | ------------------------------- | ----------------------------------- |
| `<leader>fD` | `n`  | `Telescope diagnostics bufnr=0` | Buffer diagnostics (Telescope)      |
| `<leader>d`  | `n`  | `vim.diagnostic.open_float()`   | Line diagnostics popup under cursor |
| `[d`         | `n`  | `vim.diagnostic.goto_prev()`    | Previous diagnostic                 |
| `]d`         | `n`  | `vim.diagnostic.goto_next()`    | Next diagnostic                     |

### Visuals & Behavior

- **Signs**: custom glyphs for Error/Warning/Info/Hint are enabled.
- **Virtual Text**: enabled with `●` prefix.
- **Underline**: enabled for diagnostics.
- **Sort by severity**: enabled.
- **No updates in insert mode**: diagnostics don’t update while typing.

### Per-Server Notes

- **Go (`gopls`)**
  - `staticcheck = true`
  - extra analyses: `unusedparams`, `shadow`

- **Rust (`rust_analyzer`)**
  - `cargo.allFeatures = true` (enable all feature flags)
  - `check.command = "clippy"` (inline diagnostics powered by `clippy`)

- **CSS (`cssls`)**
  - Ignores unknown `@rules` for css/scss/less (less noisy)

- **Tailwind (`tailwindcss`)**
  - Enabled for: `html`, `css`, `scss`, `sass`, `javascript(react)`, `typescript(react)`, `svelte`

- **Svelte (`svelte`)**
  - Notifies server on `*.js`/`*.ts` file writes to keep diagnostics in sync

- **GraphQL (`graphql`)**
  - Filetypes: `graphql`, `gql`, `svelte`, `typescriptreact`, `javascriptreact`

- **Emmet (`emmet_ls`)**
  - Filetypes: `html`, `tsx/jsx`, `css/sass/scss/less`, `svelte`

- **TypeScript/JS (`ts_ls`)**
  - Using the modern `ts_ls` server (placeholder config, inherits global capabilities)

- **Lua (`lua_ls`)**
  - Runtime `LuaJIT`, globals include `vim`, telemetry disabled
  - Workspace library includes Neovim runtime & luv/busted libs
  - Completion: `callSnippet = "Replace"`

### Tips

- **Telescope integration** is used for the heavy hitters (`gd`, `gR`, etc.), so you get nice pickers instead of raw jumps.
- All LSP capabilities from `cmp-nvim-lsp` are applied **globally** (via `lspconfig.util.default_config`), so completion works uniformly across servers.

---

## `<C-w>` Window Management Keymaps

| Key Combo | Mode | Action                        | Description                                              |
| --------- | ---- | ----------------------------- | -------------------------------------------------------- |
| `<C-w>m`  | `n`  | `:MaximizerToggle`            | Toggle Maximizer (maximize/restore current split window) |
| `<C-w>d`  | `n`  | `vim.diagnostic.open_float()` | Show diagnostics under cursor (LSP diagnostic popup)     |
| `<C-w>v`  | `n`  | `:vsplit`                     | Split window vertically                                  |
| `<C-w>s`  | `n`  | `:split`                      | Split window horizontally                                |
| `<C-w>q`  | `n`  | `:quit`                       | Close current window                                     |
| `<C-w>o`  | `n`  | `:only`                       | Close all windows except the current one                 |
| `<C-w>h`  | `n`  | Move cursor left              | Focus window to the left                                 |
| `<C-w>l`  | `n`  | Move cursor right             | Focus window to the right                                |
| `<C-w>k`  | `n`  | Move cursor up                | Focus window above                                       |
| `<C-w>j`  | `n`  | Move cursor down              | Focus window below                                       |
| `<C-w>=`  | `n`  | Equalize window sizes         | Make all splits equal size                               |
| `<C-w>_`  | `n`  | Maximize height               | Make current split take full height                      |
| `<C-w>\|` | `n`  | Maximize width                | Make current split take full width                       |
| `<C-w>x`  | `n`  | Exchange window with next     | Swap current window position with the next               |
| `<C-w>r`  | `n`  | Rotate windows forward        | Move all windows positions forward                       |
| `<C-w>R`  | `n`  | Rotate windows backward       | Move all windows positions backward                      |
| `<C-w>T`  | `n`  | Break out into a new tab      | Move current split into its own tab                      |
| `<C-w>H`  | `n`  | Move split to far left        | Change split layout and move to far left                 |
| `<C-w>L`  | `n`  | Move split to far right       | Change split layout and move to far right                |
| `<C-w>K`  | `n`  | Move split to top             | Change split layout and move to top                      |
| `<C-w>J`  | `n`  | Move split to bottom          | Change split layout and move to bottom                   |

---

### Tip: Open Cheatsheet in Tmux Popup

Add this to your `.tmux.conf`:

```tmux
bind g display-popup -E "bat --paging=always ~/.config/tmux/tmux-flash-cheatsheet.md"
```

Then press `<prefix> g` to view this file anytime.
