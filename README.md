# My config files
These are my configuration files for vim, gvim, neovim, bash and such.

## Using the files
You can use stow for quickly syncing between new devices, clone the repository and move/copy de files to where you need them, or just copy the parts of each file you need.
https://www.gnu.org/software/stow/manual/stow.html

## Installing Plugins
Change the route of plugins inside **plug#begin()** depending on where they are saved.

### Vim
Since vimrc is using *junegunn's vim-plug*, use `:PlugInstall` to install the plugins.

### Neovim
For Neovim, you should also run `:PackerSync`.
This Neovim configuration **requires** having this vimrc file too.
