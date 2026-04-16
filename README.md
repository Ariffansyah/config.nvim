# config.nvim

A LazyVim-based Neovim configuration optimized for modern web development and general programming.

## About

This is my personal Neovim setup built on top of LazyVim. It's configured for full-stack development, includes support for many other languages. The goal is to have a fast, feature-rich IDE experience without leaving the terminal.

## Preview

![employee.nvim Preview](./screenshots/employee1.png)
![employee.nvim Preview 2](./screenshots/employee2.png)
![employee.nvim Preview 3](./screenshots/employee3.png)

## What's Included

**Editor Features**

- Advanced syntax highlighting via Treesitter
- Smart autocompletion with nvim-cmp
- Fuzzy finding for files and text
- Tree-based file explorer
- Code snippets support
- Multiple cursors and visual enhancements
- Text object manipulation with mini.nvim
- Enhanced text objects with mini.ai

**Code Quality Tools**

- ESLint for JavaScript/TypeScript linting
- Prettier and other formatters for automatic code formatting
- Real-time diagnostics and error checking
- Built-in LSP support for multiple languages

**Development Tools**

- Integrated debugger (DAP)
- Git integration with visual diff, blame, and staging
- Terminal emulator inside Neovim
- Testing framework integration
- Session persistence
- Project management

**Language Support**

- JavaScript/TypeScript (with JSX/TSX)
- HTML/CSS/SCSS
- Lua
- Python
- Rust
- Go
- JSON/YAML
- Markdown with live preview
- And more through LSP

## Installation Prerequisites

For Ubuntu/Debian:

```bash
sudo apt install ripgrep fd-find
```

For macOS:

```bash
brew install ripgrep fd
```

## Installation

Back up your existing config first:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

Clone this repository:

```bash
git clone https://github.com/Ariffansyah/employee.nvim.git ~/.config/nvim
```

Start Neovim:

```bash
nvim
```

On first launch, LazyVim will automatically install all plugins. This might take a few minutes. Once it's done, restart Neovim and you're good to go.

## Keybindings

The leader key is set to Space.

### General

| Key           | Action                                |
| ------------- | ------------------------------------- |
| `<leader>w`   | Save current file                     |
| `<leader>q`   | Quit current window                   |
| `<leader>Q`   | Quit all                              |
| `<C-h/j/k/l>` | Navigate between splits               |
| `<A-h/l>`     | Navigate between buffers              |
| `<leader>bd`  | Delete current buffer                 |
| `<leader>bD`  | Delete all buffers except current     |
| `jk` or `kj`  | Exit insert mode (alternative to Esc) |

### File Navigation

| Key          | Action                      |
| ------------ | --------------------------- |
| `<leader>e`  | Toggle file explorer        |
| `<leader>ff` | Find files                  |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Browse open buffers         |
| `<leader>fr` | Recent files                |
| `<leader>fs` | Search current word         |
| `<leader>/`  | Search in current buffer    |

### LSP and Code

| Key          | Action                |
| ------------ | --------------------- |
| `gd`         | Go to definition      |
| `gr`         | Go to references      |
| `gI`         | Go to implementation  |
| `gy`         | Go to type definition |
| `K`          | Hover documentation   |
| `gD`         | Go to declaration     |
| `<leader>ca` | Code actions          |
| `<leader>cr` | Rename symbol         |
| `<leader>cf` | Format current file   |
| `<leader>cd` | Line diagnostics      |
| `]d`         | Next diagnostic       |
| `[d`         | Previous diagnostic   |
| `]e`         | Next error            |
| `[e`         | Previous error        |

### Text Objects (mini.ai)

Enhanced text objects for more precise text manipulation. Works with any operator (`d`, `c`, `y`, `v`, etc.)

#### Built-in Text Objects (Enhanced)

| Key            | Text Object                     | Example                            |
| -------------- | ------------------------------- | ---------------------------------- |
| `diw`          | Delete inner word               | `hello` → ``                       |
| `daw`          | Delete around word (with space) | `hello world` → `world`            |
| `di"`          | Delete inside quotes            | `"hello"` → `""`                   |
| `da"`          | Delete around quotes            | `"hello"` → ``                     |
| `di'`          | Delete inside single quotes     | `'hello'` → `''`                   |
| `da'`          | Delete around single quotes     | `'hello'` → ``                     |
| `di(` or `dib` | Delete inside parentheses       | `(hello)` → `()`                   |
| `da(` or `dab` | Delete around parentheses       | `(hello)` → ``                     |
| `di[`          | Delete inside brackets          | `[hello]` → `[]`                   |
| `da[`          | Delete around brackets          | `[hello]` → ``                     |
| `di{` or `diB` | Delete inside braces            | `{hello}` → `{}`                   |
| `da{` or `daB` | Delete around braces            | `{hello}` → ``                     |
| `dit`          | Delete inside HTML/XML tag      | `<div>hello</div>` → `<div></div>` |
| `dat`          | Delete around tag               | `<div>hello</div>` → ``            |
| `dip`          | Delete inner paragraph          | Deletes current paragraph          |
| `dap`          | Delete around paragraph         | Deletes paragraph + blank line     |
| `dis`          | Delete inner sentence           | Deletes sentence content           |
| `das`          | Delete around sentence          | Deletes sentence + space           |

#### Function/Call Text Objects

| Key   | Text Object                 | Example                                 |
| ----- | --------------------------- | --------------------------------------- |
| `dif` | Delete inside function      | `function() { code }` → `function() {}` |
| `daf` | Delete around function      | `function() { code }` → ``              |
| `dic` | Delete inside function call | `func(arg1, arg2)` → `func()`           |
| `dac` | Delete around function call | `func(arg1, arg2)` → ``                 |

#### Argument Text Objects

| Key    | Text Object                | Example                           |
| ------ | -------------------------- | --------------------------------- |
| `dia`  | Delete inner argument      | `func(arg1, arg2)` → `func(arg2)` |
| `daa`  | Delete around argument     | `func(arg1, arg2)` → `func(arg2)` |
| `dina` | Delete inner next argument | Targets next argument             |
| `dila` | Delete inner last argument | Targets last argument             |

**Common Operators:**

- `d` - Delete
- `c` - Change (delete and enter insert mode)
- `y` - Yank (copy)
- `v` - Visual select
- `=` - Auto-indent
- `gU` - Uppercase
- `gu` - Lowercase

**Examples:**

```javascript
// Cursor inside function:
function hello(name, age, city) {
  console.log("Hello " + name);
  return name;
}

// Press 'dif' - Delete inside function:
function hello(name, age, city) {
}

// Press 'daa' on 'age' - Delete around argument:
function hello(name, city) {

// Press 'ci"' - Change inside quotes:
console.log("Hello " + name);
//           ^ cursor here, type new text

// Press 'yit' - Yank inside tag:
<button>Click me</button>
// Copies: Click me

// Press 'vip' - Visual select inner paragraph
// Selects entire paragraph
```

**Tips:**

- Use `i` (inner) to exclude delimiters
- Use `a` (around) to include delimiters
- Works with any motion: `ciw`, `yit`, `vip`, `daf`, etc.
- Supports nested structures (finds nearest containing object)
- Works across multiple lines (configured for 500 lines)

### Text Manipulation (mini.nvim)

#### Surround Text

Wrap text with quotes, brackets, parentheses, etc.

| Key             | Action                             | Example                       |
| --------------- | ---------------------------------- | ----------------------------- |
| `gsaiw"`        | Surround inner word with `""`      | `hello` → `"hello"`           |
| `gsaiw'`        | Surround inner word with `''`      | `hello` → `'hello'`           |
| `gsaiw)`        | Surround inner word with `()`      | `hello` → `(hello)`           |
| `gsaiw]`        | Surround inner word with `[]`      | `hello` → `[hello]`           |
| `gsaiw}`        | Surround inner word with `{}`      | `hello` → `{hello}`           |
| `gsaip"`        | Surround inner paragraph with `""` | Wraps entire paragraph        |
| `gsa"` (visual) | Surround selection with `""`       | Select text first, then press |
| `gsd"`          | Delete surrounding `""`            | `"hello"` → `hello`           |
| `gsd)`          | Delete surrounding `()`            | `(hello)` → `hello`           |
| `gsr"'`         | Replace `""` with `''`             | `"hello"` → `'hello'`         |
| `gsr)]`         | Replace `()` with `[]`             | `(hello)` → `[hello]`         |
| `gsh"`          | Highlight text inside `""`         | Visual highlight              |

**Quick Tips:**

- Use `gsa` + motion + character in normal mode
- Use `gsa` + character in visual mode (select text first)
- Common motions: `iw` (inner word), `ip` (inner paragraph), `is` (inner sentence)
- Works with HTML tags: `gsiwt` then type tag name

#### Move Lines

| Key                | Action                             |
| ------------------ | ---------------------------------- |
| `<M-j>` or `<A-j>` | Move line/selection down           |
| `<M-k>` or `<A-k>` | Move line/selection up             |
| `<M-h>` or `<A-h>` | Move line/selection left (indent)  |
| `<M-l>` or `<A-l>` | Move line/selection right (indent) |

**Note:** `<M-j>` means Alt+j on Linux/Windows, Option+j on macOS

#### Split/Join Code

| Key  | Action                                  |
| ---- | --------------------------------------- |
| `gS` | Toggle split/join (smart context-aware) |

Examples:

```lua
-- Before gS:
local data = { name = "John", age = 30 }

-- After gS:
local data = {
  name = "John",
  age = 30
}
```

#### Auto-pairs

Automatically adds closing brackets and quotes as you type:

- Type `"` → `""` (cursor in middle)
- Type `(` → `()` (cursor in middle)
- Type `[` → `[]` (cursor in middle)
- Type `{` → `{}` (cursor in middle)

### Git

| Key          | Action            |
| ------------ | ----------------- |
| `<leader>gg` | Open lazygit      |
| `<leader>gb` | Git blame line    |
| `<leader>gd` | Git diff          |
| `<leader>gs` | Git status        |
| `<leader>gh` | Preview git hunk  |
| `<leader>gr` | Reset git hunk    |
| `<leader>gR` | Reset buffer      |
| `<leader>gS` | Stage hunk        |
| `]h`         | Next git hunk     |
| `[h`         | Previous git hunk |

### Terminal

| Key          | Action                        |
| ------------ | ----------------------------- |
| `<C-/>`      | Toggle floating terminal      |
| `<leader>ft` | Open terminal in split        |
| `<C-\>`      | Toggle terminal (insert mode) |

### Debugging

| Key          | Action            |
| ------------ | ----------------- |
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue          |
| `<leader>di` | Step into         |
| `<leader>do` | Step over         |
| `<leader>dO` | Step out          |
| `<leader>dr` | Toggle REPL       |
| `<leader>dl` | Run last          |
| `<leader>du` | Toggle UI         |

### Editing

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<A-j>`      | Move line down               |
| `<A-k>`      | Move line up                 |
| `<leader>uh` | Toggle inlay hints           |
| `<leader>ul` | Toggle line numbers          |
| `<leader>ur` | Toggle relative line numbers |
| `<leader>us` | Toggle spelling              |
| `<leader>uw` | Toggle word wrap             |
| `gcc`        | Toggle line comment          |
| `gbc`        | Toggle block comment         |
| `gc`         | Comment (in visual mode)     |

### Search and Replace

| Key          | Action                                 |
| ------------ | -------------------------------------- |
| `<leader>sr` | Search and replace                     |
| `<leader>sR` | Search and replace (word under cursor) |
| `n`          | Next search result                     |
| `N`          | Previous search result                 |
| `<Esc>`      | Clear search highlight                 |

### Sessions

| Key          | Action                     |
| ------------ | -------------------------- |
| `<leader>qs` | Save session               |
| `<leader>ql` | Load last session          |
| `<leader>qd` | Don't save current session |

## Customization

To add your own keybindings, edit `lua/config/keymaps.lua`:

```lua
local keymap = vim.keymap.set

-- Save with Ctrl+s
keymap("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Quick access to config
keymap("n", "<leader>fc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })
```

To change editor options, edit `lua/config/options.lua`:

```lua
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
```

To modify or add plugins, create or edit files in `lua/plugins/`. LazyVim will automatically load them.

## Common Tasks

**Installing language servers:**

```
:Mason
```

This opens the Mason UI where you can install LSP servers, formatters, and linters.

**Updating plugins:**

```
:Lazy update
```

**Checking LSP status:**

```
:LspInfo
```

**Checking installed formatters/linters:**

```
:Mason
```

**View all keybindings:**

```
:Telescope keymaps
```

## Troubleshooting

**Plugins not loading:**
Try syncing Lazy:

```
:Lazy sync
```

**LSP not working:**
Check if the language server is installed:

```
:LspInfo
:Mason
```

**Slow startup:**
Profile your plugins:

```
:Lazy profile
```

**Something broke after an update:**
Try clearing the cache:

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
```

Then restart Neovim to reinstall everything.

**Treesitter parser issues:**

```
:TSUpdate
```

## Tips

- Use `:checkhealth` to diagnose common issues
- Press `K` twice to jump into hover documentation window
- Use `<leader>sG` to live grep with arguments (powerful for complex searches)
- Learn the LSP keybindings - they're the most useful ones
- Customize the colorscheme in your plugin config
- Use `:Telescope commands` to discover available commands
- The `which-key` plugin shows you available keybindings as you type
- **Surround text efficiently:** Position cursor on word, type `gsaiw"` to wrap with quotes
- **Quick refactoring:** Use `gsd` to remove, `gsr` to replace surrounding characters
- **Move code blocks:** Select in visual mode, then use `<Alt-j/k>` to move up/down
- **Delete function contents:** Use `dif` to empty a function while keeping its signature
- **Change function arguments:** Use `cia` to replace an argument in a function call
- **Copy inside tags:** Use `yit` to yank content inside HTML/XML tags
- **Select paragraph:** Use `vip` to visually select an entire paragraph

## Contributing

If you find bugs or have suggestions, feel free to open an issue or submit a pull request.
