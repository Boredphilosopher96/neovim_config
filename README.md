# Neovim Config

To add this config to a new computer, clone the repository in ~/.config/

## Install for a new system

### Install Packer

First to run the config, we need to install packer

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Sync packages

Now to install all external plugins, navigate to the *packer.lua* file
Source it using the command

```vim
:so
```

Then run

```vim
:PackerSync
```

### Source other files

After all packages are installed, we need to source all the other files so that our new keymaps work. To do that, run

```bash
chmod +x init.sh
bash init.sh
```

### Missing grep

Grep functionality from this might be missing when you freshly install the config.
You can access it by running the command

```bash
brew install ripgrep
```
