# My Neovim Configuration

This is my personal Neovim configuration managed using Lua and LazyVim.

## Features

- Bufferline with safe buffer close integration (`mini.bufremove`)
- Neo-tree filesystem explorer setup
- LSP and autocompletion configured
- Various plugins for colorschemes, git, fuzzy finder, etc.

## Installation

> **Important:** If you already have an existing Neovim config, back it up first!

You can move your current Neovim config out of the way before cloning:
```text
mv ~/.config/nvim ~/.config/nvim_backup
```

Then clone this repo as your new config:
```text
git clone https://github.com/PiyushShiv26/nvim_config.git ~/.config/nvim
```

## Usage

1. Open Neovim.
2. Run `:Lazy sync` (or your plugin manager's install command).
3. Restart Neovim.

Feel free to customize the plugins and settings inside `lua/plugins`.

---

Enjoy your improved Neovim experience!
