# dotfiles

Repo for all my dotfiles

## Full Installation on Windows with WSL

I can probably automate this someday...

### Prereqs

- WSL
  - gh (Github CLI)
  - stow
  - fzf
- CaskaydiaMono Nerd Font (Install on Windows)
  - (Can replace with Nerd font of your choice)


### bashrc + inputrc

Note: This enables vi mode for bash

```shell
cd dotfiles
stow bash && stow input
cd ~
source .bashrc .inputrc
```

### Scripts

Using ThePrimeagen's tmux_sessionizer and tmux_windowizer scripts from [here](https://github.com/ThePrimeagen/.dotfiles)

```shell
cd dotfiles
stow scripts
chmod +x tmux_sessionizer tmux_windowizer
```

### Tmux

```shell
cd dotfiles
stow tmux
tmux
```

#### Install TPM and plugins

1. Clone [TPM](https://github.com/tmux-plugins/tpm) into `~/dotfiles/.tmux/plugins`
2. Install plugins by opening `tmux` and running `<prefix>I`
3. Source tmux: `source ~/dotfiles/.tmux.conf` or run `<prefix>r`

### Neovim

Neovim >= 0.10 is required for some plugins to work.

```shell
cd dotfiles
stow nvim
nvim
```
