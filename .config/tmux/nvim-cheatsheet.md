# Nvim Cheatsheet

## Flash.nvim Cheatsheet

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

## Substitute.nvim Cheatsheet

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

## Treesitter Textobjects Cheatsheet

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

### Tip: Open Cheatsheet in Tmux Popup

Add this to your `.tmux.conf`:

```tmux
bind g display-popup -E "bat --paging=always ~/.config/tmux/tmux-flash-cheatsheet.md"
```

Then press `<prefix> g` to view this file anytime.
