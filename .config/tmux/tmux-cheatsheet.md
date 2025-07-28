# Tmux Cheatsheet

A quick reference for custom and default tmux key bindings.
Includes session management, layout, mouse, pane resizing, and buffer controls.

### Custom Key Bindings (prefix + key)

| Key Combo  | Action                             | Description                                      |
| ---------- | ---------------------------------- | ------------------------------------------------ |
| `Ctrl + r` | Restore session (`tmux-resurrect`) | Restores all windows and panes from last session |
| `Ctrl + s` | Save session (`tmux-resurrect`)    | Saves current state of windows/panes             |
| `F`        | Launch `tmux-fzf` main menu        | Fuzzy select: sessions, windows, panes, commands |
| `I`        | Install plugins (`TPM`)            | Executes `install_plugins`                       |
| `U`        | Update plugins (`TPM`)             | Executes `update_plugins`                        |
| `Alt + u`  | Remove unused plugins (`TPM`)      | Executes `clean_plugins`                         |
| `M`        | Run `monitoring.sh`                | Custom script for resource monitoring            |
| `h`        | Show cheatsheet (`bat`)            | `bat ~/.config/tmux/tmux-cheatsheet.md`          |

### Mouse Bindings (no prefix)

| Mouse Action         | Action                       | Description                |
| -------------------- | ---------------------------- | -------------------------- |
| Double-click on pane | Copy word to clipboard       | Works in root or copy-mode |
| Triple-click on pane | Copy whole line to clipboard | Works in root or copy-mode |

### Navigation & Session Management (prefix + key)

| Key       | Action                            | Description                            |
| --------- | --------------------------------- | -------------------------------------- |
| `C-o`     | Rotate through panes              | Cycles through visible panes           |
| `!`       | Break pane into new window        | Moves active pane to new window        |
| `&`       | Kill current window               | Closes the active window               |
| `'`       | Prompt for window index           | Jump to a specific window              |
| `(` / `)` | Switch to previous / next session | Changes client focus                   |
| `,`       | Rename current window             | Renames the window                     |
| `.`       | Move current window               | Changes its index                      |
| `:`       | Open command prompt               | Run any tmux command                   |
| `;`       | Switch to last active pane        | Go back to previously focused pane     |
| `[`       | Enter copy-mode                   | Enables text selection and scrolling   |
| `]`       | Paste from buffer                 | Inserts the most recent copied content |
| `z`       | Zoom active pane                  | Toggle fullscreen for a pane           |
| `x`       | Kill active pane                  | Closes the currently focused pane      |
| `t`       | Show clock                        | Displays an in-terminal clock          |
| `d`       | Detach session                    | Detaches the current client            |
| `C-z`     | Suspend tmux (shell background)   | Only works if shell allows suspend     |

### Window Management (prefix + key)

| Key   | Action                  | Description                 |
| ----- | ----------------------- | --------------------------- |
| `c`   | Create new window       |                             |
| `n`   | Next window             |                             |
| `p`   | Previous window         |                             |
| `0-9` | Select window by number | 0 = first, 1 = second, etc. |
| `$`   | Rename session          | Renames the whole session   |
| `D`   | Detach client from list | Choose a client to detach   |
| `&`   | Kill current window     | Closes the active window    |

### Resizing Panes (prefix + key or modifier + arrows)

| Shortcut          | Action                      | Description                               |
| ----------------- | --------------------------- | ----------------------------------------- |
| `prefix + h`      | Resize pane left            | Custom: works even when arrows don't      |
| `prefix + l`      | Resize pane right           | Custom horizontal resize                  |
| `prefix + j`      | Resize pane down            | Custom vertical resize                    |
| `prefix + k`      | Resize pane up              | Custom vertical resize                    |
| `Ctrl + ←/→/↑/↓`  | Resize by 1 cell            | Arrow keys (may not work on some laptops) |
| `Alt + ←/→/↑/↓`   | Resize by 5 cells           | Faster resizing using Alt + Arrows        |
| `Shift + ←/→/↑/↓` | Scroll viewport (copy-mode) | Scroll content inside the pane            |

### Buffers & Messages (prefix + key)

| Key     | Action                    | Description                  |
| ------- | ------------------------- | ---------------------------- |
| `=`     | Choose buffer             | Open buffer list             |
| `#`     | Show all paste buffers    | List all buffers             |
| `~`     | Show message log          | View recent tmux messages    |
| `PPage` | Page Up & enter copy-mode | Scroll and enter copy-mode   |
| `?`     | List all key bindings     | Overview of default bindings |
| `/`     | Search key bindings       | Describe specific key        |
| `i`     | Display window info       | Info about current window    |

---

Tip: Use `prefix + h` to open this cheatsheet in a popup via tmux:

```tmux
bind h display-popup -E "bat --paging=always ~/.config/tmux/tmux-cheatsheet.md"
```
