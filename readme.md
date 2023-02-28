# My Dotfiles

These are my personal dotfiles, including my Neovim configuration.

## Installation

To use these dotfiles on a new machine, follow these steps:

1. Clone the repository to your home directory:

```
git clone https://github.com/knhn1004/dotfiles.git ~/dotfiles
```


2. Create a symbolic link from the `init.lua` file in the `nvim` directory to your Neovim configuration directory:

```
ln -s ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
```


3. Install Packer.nvim by cloning its GitHub repository to the `~/.local/share/nvim/site/pack/packer/start` directory:

```
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

4. Open Neovim and run the `:PackerCompile` command to install the plugins defined in the `init.lua` file.


```
nvim +PackerCompile
```


This will compile and install the plugins using Packer.nvim.

5. Restart Neovim to apply the changes.


```
nvim
```


## Usage

This Neovim configuration includes the following plugins:

- [Packer.nvim](https://github.com/wbthomason/packer.nvim) for managing plugins.
- [vim-sensible](https://github.com/tpope/vim-sensible) for sensible default settings.
- [vim-surround](https://github.com/tpope/vim-surround) for working with surroundings.
- [coc.nvim](https://github.com/neoclide/coc.nvim) for autocompletion.
- [fern.vim](https://github.com/lambdalisue/fern.vim) for a file explorer.
- [gruvbox](https://github.com/morhetz/gruvbox) for a color scheme.
- [vim-commentary](https://github.com/tpope/vim-commentary) for commenting code.
- [ultisnips](https://github.com/SirVer/ultisnips) for snippets.

You can use the configuration by opening Neovim and using the key mappings and commands defined in the `init.lua` file.

Here are some of the key mappings and commands defined in the configuration:

- `<leader>f` - Open the file explorer.
- `<C-A-n>` - Compile and run a C++ file.
- `<C-h>` - Move to the left window.
- `<C-j>` - Move to the window below.
- `<C-k>` - Move to the window above.
- `<C-l>` - Move to the right window.
- `<C-_>` - Comment or uncomment a line of code.

## Credits

This configuration was created by [Oliver](https://github.com/knhn1004). Feel free to use it and modify it to your liking.


