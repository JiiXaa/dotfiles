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

### Tip: Open Cheatsheet in Tmux Popup

Add this to your `.tmux.conf`:

```tmux
bind g display-popup -E "bat --paging=always ~/.config/tmux/tmux-flash-cheatsheet.md"
```

Then press `<prefix> g` to view this file anytime.
