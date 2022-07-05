# Dotfiles

This is a collection of all my configuration files, managed using GNU stow, and
deployed using my `install.sh` script. It is intended to be run from a clean
arch install.

## Info

|           distro | <span style="font-weight:normal">Arch Linux</span> |
|-----------------:|----------------------------------------------------|
|        **shell** | zsh                                                |
|     **terminal** | st                                                 |
|           **wm** | dwm                                                |
|     **launcher** | dmenu                                              |
|       **editor** | neovim                                             |
|      **browser** | Brave                                              |
|        **music** | ncmpcpp                                            |
| **image viewer** | sxiv                                               |
| **video player** | mpv                                                |
|         **font** | DejaVu Sans Mono                                   |
|       **colors** | gruvbox                                            |

- Useful scripts stolen from all over the place are in `~/.local/bin/`
- I try to minimize what's directly in `~` so:
	- All configs that can be in `~/.config/` are.
	- Some environmental variables have been set in `~/.zprofile` to move configs into `~/.config/`
- Bookmarks in text files used by various scripts (like `~/.local/bin/shortcuts`)
	- File bookmarks in `~/.config/shell/bm-files`
	- Directory bookmarks in `~/.config/shell/bm-dirs`

## Usage

These dotfiles are intended to go with numerous suckless programs I use:

- [dwm](https://github.com/pahlse/dwm) (window manager)
- [dwmblocks](https://github.com/pahlse/dwmblocks) (statusbar)
- [st](https://github.com/pahlse/st) (terminal emulator)

I also use [mutt-wizard](https://github.com/lukesmithxyz/mutt-wizard), which
gives you an easy-to-install terminal-based email client regardless of your
email provider.

## Install

`git clone --recurse-submodules https://github.com/pahlse/dotfiles ~/.dotfiles`

Then use the `install.sh` script to install the dependencies:

```
cd ~/.dotfiles/installer
./install.sh
```

## Manage

I use [GNU stow](https://www.gnu.org/software/stow/) to manage my git repos and
dotfiles. I got this idea from [this post](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html), and can only recommend it.

To use stow:
```bash
cd ~/.dotfiles
# the contents (dotfiles) of these directories are symlinked to ~/
stow xorg zsh

cd ~/.dotfiles/config
# create symlinks in the target directory ~/.config
stow -t ~/.config dunst nvim ranger
```

To remove:
```bash
cd ~/.dotfiles
stow -D zsh

cd ~/.dotfiles/config
stow -t ~/.config -D ranger
```

Note: you can use an alias like `stowc='stow -t ~/.config'` to manage `~/.dotfiles/config`

## Suckless Packages
The [suckless](https://suckless.org/) software I use, is forked from [Luke Smith](https://github.com/LukeSmithxyz) and added as a submodules to this
repository. The forked repositories come with some added patches which I
personally like. Dependencies for building this software are `make` and a C
compiler.

```bash
cd ~/.dotfiles/suckless/dwm
make
```
This will create a `config.h` which you can modify to your liking.
Install with: `sudo make clean install`.

Or you can switch to a branch which already contains a `config.h`

## Startup
If you use my xorg configuration there will be a `.xinitrc` which starts `dwm` when you run `startx`.
