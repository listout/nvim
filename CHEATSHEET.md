# Neovim cheatsheet

Shortcuts and commands available in this config, including the built-in
Neovim (master) and plugin defaults it relies on.

- **Leader:** `,`
- **Local leader:** `\` (default, used by VimTeX)
- Modes: **n** normal, **v/x** visual, **i** insert, **s** select, **o** operator-pending, **t** terminal
- Run `:Maps` (`,M`) to fuzzy-search every normal-mode mapping live.

---

## General

| Keys | Mode | Action |
|---|---|---|
| `↑ ↓ ← →` | all | Disabled (use `hjkl`) |
| `,r` | n | Source the current file (`:so %`) |
| `gc{motion}` / `gcc` | n, x | Toggle comment (built-in) |
| `gc` | o | Comment text object, e.g. `dgc` |
| `q` | n | Close help, quickfix, man, checkhealth, fugitive, git and diff windows |

Yanks go to the system clipboard locally (`unnamedplus`) and over OSC 52 in SSH sessions.

## Windows and splits

| Keys | Mode | Action |
|---|---|---|
| `,tk` | n | Turn vertical splits into horizontal |
| `,th` | n | Turn horizontal splits into vertical |
| `Alt-j` / `Alt-k` | n | Height −2 / +2 |
| `Alt-l` / `Alt-h` | n | Width −2 / +2 |
| `Ctrl-w` | t | Leave terminal mode and start a window command |

Splits open to the right and below. Windows are equalized when the terminal is resized.

## Files, search and navigation (fzf.vim, nvim-tree)

| Keys | Mode | Action |
|---|---|---|
| `,F` | n | `:Files` – find files |
| `,B` | n | `:Buffers` – open buffers |
| `,A` | n | `:RG` – live ripgrep (re-runs on every keystroke) |
| `,C` | n | `:Commits` – git commits |
| `,M` | n | `:Maps` – normal-mode mappings |
| `,E` | n | Toggle the nvim-tree file explorer |

**Inside fzf:** `Ctrl-/` toggles preview (hidden by default) · `Ctrl-t` / `Ctrl-x` / `Ctrl-v` open in tab / split / vsplit.

Other fzf.vim commands: `:GFiles`, `:Rg`, `:Lines`, `:BLines`, `:BCommits`, `:History`, `:History:`, `:Helptags`, `:Commands`.

**Inside nvim-tree** (`g?` shows all):

| Keys | Action | Keys | Action |
|---|---|---|---|
| `<CR>` / `o` | Open | `a` | Create file/dir (end with `/`) |
| `Ctrl-v` / `Ctrl-x` / `Ctrl-t` | Open in vsplit / split / tab | `r` | Rename |
| `-` | Go up a directory | `d` | Delete |
| `<BS>` | Close directory | `x` / `c` / `p` | Cut / copy / paste |
| `H` | Toggle dotfiles (hidden by default) | `y` | Copy name |
| `R` | Refresh | `q` | Close |

## LSP

Servers: `lua_ls`, `clangd`, `basedpyright` (configs from nvim-lspconfig, overrides in `after/lsp/`).

| Keys | Mode | Action | Source |
|---|---|---|---|
| `gd` | n | Go to definition | config |
| `gD` | n | Go to declaration | config |
| `K` | n | Hover docs | built-in |
| `grn` | n | Rename | built-in |
| `gra` | n, x | Code action | built-in |
| `grr` | n | References | built-in |
| `gri` | n | Implementation | built-in |
| `grt` | n | Type definition | built-in |
| `grx` | n | Run codelens | built-in |
| `gO` | n | Document symbols | built-in |
| `Ctrl-k` | n | Signature help | config |
| `Ctrl-s` | i, s | Signature help | built-in |
| `,f` | n, v | Format buffer / selection | config |
| `,wa` / `,wr` / `,wl` | n | Add / remove / list workspace folders | config |

**Commands**

| Command | Action |
|---|---|
| `:lsp enable [name]` / `:lsp disable [name]` | Enable / disable a server config |
| `:lsp restart [name]` / `:lsp stop [name]` | Restart / stop clients |
| `:checkhealth vim.lsp` | LSP status |
| `:LspPyrightOrganizeImports` | Organize Python imports (basedpyright) |
| `:LspPyrightSetPythonPath {path}` | Point basedpyright at a Python interpreter |

## Diagnostics

| Keys | Mode | Action |
|---|---|---|
| `]d` / `[d` | n | Next / previous diagnostic, then open its float |
| `]D` / `[D` | n | Last / first diagnostic (built-in) |
| `,e` | n | Open diagnostic float |
| `Ctrl-w d` | n | Open diagnostic float (built-in) |
| `,q` | n | Send diagnostics to the location list |

Signs only (no virtual text or underline). Diagnostics update after leaving insert mode.

## Completion (nvim-cmp) and snippets (LuaSnip)

| Keys | Mode | Action |
|---|---|---|
| `Ctrl-Space` | i | Open completion |
| `Tab` / `Shift-Tab` | i, s | Next / previous item, or jump forward/back in a snippet |
| `Ctrl-n` / `Ctrl-p` | i | Next / previous item |
| `Enter` | i | Expand snippet, or confirm (selects the first item) |
| `Ctrl-y` | i | Confirm |
| `Ctrl-e` | i | Abort |
| `Ctrl-f` / `Ctrl-d` | i | Scroll docs down / up |
| `Ctrl-j` / `Ctrl-k` | i, s | Jump to next / previous snippet field |

**Command line:** `:` completes paths and commands (`Tab` / `Shift-Tab` to cycle). In `/` search, buffer completion only opens on request.

`(` is added automatically after confirming a function (nvim-autopairs). In gitcommit buffers, completion offers git issues/PRs/mentions (cmp-git).

## Git (gitsigns, fugitive)

Buffer-local in git-tracked files:

| Keys | Mode | Action |
|---|---|---|
| `]c` / `[c` | n | Next / previous hunk (next/previous change in diff mode) |
| `,hs` | n, v | Stage hunk (on a staged hunk: unstage) |
| `,hr` | n, v | Reset hunk |
| `,hS` | n | Stage buffer |
| `,hR` | n | Reset buffer |
| `,hp` | n | Preview hunk |
| `,td` | n | Preview hunk inline |
| `,hb` | n | Full blame for the current line |
| `,tb` | n | Toggle current-line blame |
| `,hd` | n | Diff against the index |
| `,hD` | n | Diff against the last commit (`~`) |
| `ih` | o, x | Hunk text object, e.g. `dih`, `vih` |

**Fugitive:** `:Git` / `:G` (status; `g?` for help inside), `:Git blame`, `:Git log`, `:Gdiffsplit`, `:Gread`, `:Gwrite`, `:Git commit`, `:Git push`.

## Treesitter

| Keys / command | Action |
|---|---|
| `[x` | Jump up to the enclosing context (sticky header) |
| `:TSInstall {lang}` / `:TSUpdate` / `:TSUninstall {lang}` | Install / update / remove parsers (needs the `tree-sitter` CLI) |
| `:TSLog` | Show parser install log |
| `:InspectTree` | Show the syntax tree |

## Editing helpers

**vim-surround**

| Keys | Mode | Action |
|---|---|---|
| `ys{motion}{char}` | n | Add surrounding, e.g. `ysiw"` |
| `yss{char}` | n | Surround the whole line |
| `cs{old}{new}` | n | Change surrounding, e.g. `cs"'` |
| `ds{char}` | n | Delete surrounding, e.g. `ds(` |
| `S{char}` | x | Surround the selection |

**vim-easy-align:** `:EasyAlign` (no mappings), e.g. visually select, then `:EasyAlign =` or `:EasyAlign *|`.

**nvim-autopairs:** brackets and quotes are closed automatically in insert mode.

## Markdown

| Keys / command | Mode | Action |
|---|---|---|
| `gf` | n | Open the file under the cursor, creating it if it doesn't exist |
| `,tm` | n | Toggle table mode (`:TableModeToggle`) |
| `,tt` | n, x | Turn CSV-like text into a table (`:Tableize`) |
| `[[` / `]]` | n, x | Previous / next section |

Spell check on, `textwidth=72`.

## LaTeX (VimTeX)

Local leader is `\`. Viewer: zathura.

| Keys | Action | Keys | Action |
|---|---|---|---|
| `\ll` | Toggle continuous compile | `\lv` | Forward search in viewer |
| `\lk` / `\lK` | Stop / stop all | `\lt` / `\lT` | Open / toggle TOC |
| `\le` | Show errors (quickfix) | `\lc` / `\lC` | Clean aux / full clean |
| `\lo` | Compiler output | `\lg` / `\lG` | Status / status of all |
| `\li` / `\lI` | Info / full info | `\lq` | Log |
| `\lx` / `\lX` | Reload / reload state | `\la` | Context menu |
| `\lL` | Compile selection (also v) | `\lm` | List insert-mode maps |
| `\ls` | Toggle main file | `\lS` | Compile one shot (single shot) |

| Keys | Action |
|---|---|
| `dse` / `cse` / `tse` | Delete / change / toggle-star environment |
| `dsc` / `csc` / `tsc` | Delete / change / toggle-star command |
| `dsd` / `csd` / `tsd` | Delete / change / toggle `\left…\right` delimiter |
| `ds$` / `cs$` / `ts$` | Delete / change / toggle inline ↔ display math |
| `tsf` | Toggle `\frac{a}{b}` ↔ `a/b` |
| `tsb` | Toggle line break `\\` |
| `%` | Jump between matching delimiters/environments |

Text objects (o, x): `ae`/`ie` environment · `ac`/`ic` command · `ad`/`id` delimiter · `a$`/`i$` math · `aP`/`iP` section · `am`/`im` item.

## Man pages

| Keys | Action |
|---|---|
| `q` | Close |
| `d` / `u` | Half page down / up |

## Writing / focus

| Command | Action |
|---|---|
| `:Goyo` | Distraction-free mode (toggle) |
| `:Limelight` / `:Limelight!` | Dim paragraphs around the cursor on / off |

## Python

`:LspPyrightOrganizeImports` · `:LspPyrightSetPythonPath {path}` · formatting with `,f` (uses black through none-ls if `black` is installed). Indent: 4 spaces, `textwidth=80`.

## Plugin management and misc

| Command | Action |
|---|---|
| `:Lazy` | Plugin manager UI (`:Lazy sync`, `:Lazy update`, `:Lazy clean`) |
| `:checkhealth` | Health checks |
| `:Gitsigns {action}` | Any gitsigns action, e.g. `:Gitsigns blame` |
| `:NvimTreeOpen` / `:NvimTreeToggle` | Open / toggle the explorer |

**Minimal config** (`nvim -u ~/.config/nvim/init_min.lua`): `:Q` quits all without saving.
