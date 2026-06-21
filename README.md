# Neovim Configuration

This repository contains a modular Neovim setup designed to be easy to read, edit, and extend.

## Quick Start

1. Install Neovim (latest stable recommended) and dependencies:
   - git, make, unzip, ripgrep
   - a clipboard tool for your platform (for example xclip on Linux)
2. Place this repo at:
   - Linux/macOS: ~/.config/nvim
   - Windows: %LOCALAPPDATA%\nvim
3. Launch Neovim:

```sh
nvim
```

4. Let lazy.nvim install plugins on first run.
5. Use :Lazy to inspect plugin status.

## Repository Structure

```text
.
├── init.lua
├── lua
│   ├── core
│   │   ├── init.lua
│   │   ├── globals.lua
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   ├── autocmds.lua
│   │   └── lazy.lua
│   └── plugins
│       ├── core.lua
│       ├── autopairs.lua
│       ├── bufferline.lua
│       ├── gitsigns.lua
│       ├── harpoon.lua
│       ├── lualine.lua
│       ├── neo-tree.lua
│       ├── overseer.lua
│       ├── toggleterm.lua
│       └── transparent.lua
└── lazy-lock.json
```

## What To Edit

- init.lua: one-line entrypoint that loads core
- lua/core/globals.lua: leader keys and global flags
- lua/core/options.lua: editor options
- lua/core/keymaps.lua: global keymaps
- lua/core/autocmds.lua: global autocmds
- lua/core/lazy.lua: lazy.nvim bootstrap and plugin import root
- lua/plugins/*.lua: plugin specs and plugin-specific config

## Load Order

Neovim startup for this config is:

1. init.lua runs
2. lua/core/init.lua runs
3. core modules load in this order:
   - globals
   - options
   - keymaps
   - autocmds
   - lazy
4. lua/core/lazy.lua bootstraps lazy.nvim and imports lua/plugins/*
5. lazy.nvim loads plugins based on each plugin spec trigger (event, keys, cmd, ft, lazy=false, etc.)

## How To Add A New Plugin

1. Create a new file in lua/plugins, for example:
   - lua/plugins/fugitive.lua
2. Return a lazy.nvim plugin spec table.
3. Add lazy-loading triggers when possible to keep startup fast.
4. Restart Neovim or run :Lazy sync.

Example:

```lua
return {
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gdiffsplit' },
    keys = {
      { '<leader>gg', '<cmd>Git<CR>', desc = 'Open Git' },
    },
  },
}
```

## How To Change Existing Configuration

### Change an option

Edit lua/core/options.lua.

Example:

```lua
vim.o.relativenumber = false
```

### Add a keymap

Edit lua/core/keymaps.lua.

Example:

```lua
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
```

### Configure a plugin

Edit that plugin file in lua/plugins.

Example:

- lua/plugins/harpoon.lua
- lua/plugins/toggleterm.lua

## Updating Plugins

- Update all plugins: :Lazy update
- Sync lockfile state: :Lazy sync
- Clean removed plugins: :Lazy clean

Commit lazy-lock.json when plugin versions change so installs stay reproducible.

## Troubleshooting

- Startup errors:
  - run nvim --headless '+qa' in this repo
- Health checks:
  - run :checkhealth inside Neovim
- Plugin issues:
  - open :Lazy and inspect errors for the plugin

## Notes

- This setup keeps behavior split by concern so changes are easy to find.
- Plugin files are intentionally separate to make future edits low-risk and reviewable.

