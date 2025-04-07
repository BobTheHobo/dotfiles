# dotfiles

Repo for all my dotfiles

## Full Installation on Windows with WSL

I can probably automate this someday...

### Prereqs

- WSL
  - gh (Github CLI)
  - stow
  - fzf
  - rg (For telescope)
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

#### Install Tmux Plugin Manager(TPM) and plugins

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

### Windows

Symlinks can be created from an elevated PowerShell to link with files stored in WSL. We can use this to allow editing of config files that are managed by Git and stored in a single repo on WSL from Windows. 

  Note: These will overwrite existing folders/files. If you don't want this behavior, run the commands without `-Force`

1. Start an elevated PS on Windows
2. Make sure you are in your user's folder (i.e., `cd C:\Users\{USERNAME}`)
3. Run the commands listed below for your respective desired program.

(TODO: Script this process)

#### Windows Terminal

```PS
New-Item -Path C:\Users\{USERNAME}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -ItemType SymbolicLink -Value \\wsl.localhost\Ubuntu\home\{WSL_USERNAME}\dotfiles\windows\wt\settings.json -Force
```

#### GlazeWM

```PS
New-Item -Path C:\Users\{USERNAME}\.glzr\glazewm\config.yaml -ItemType SymbolicLink -Value \\wsl.localhost\Ubuntu\home\{WSL_USERNAME}\dotfiles\windows\glazewm\config.yaml -Force
```

#### Zebar

```
New-Item -Path C:\Users\{USERNAME}\.glzr\zebar -ItemType SymbolicLink -Value \\wsl.localhost\Ubuntu\home\{WSL_USERNAME}\dotfiles\windows\zebar -Force
```
  Note: This links the Zebar directory, whereas the others only link a config file.

#### TranslucentTb

```
New-Item -Path C:\Users\{USERNAME}\AppData\Local\Packages\28017CharlesMilette.TranslucentTB_v826wp6bftszj\RoamingState\settings.json -ItemType SymbolicLink -Value \\wsl$\Ubuntu\home\{WSL_USERNAME}\dotfiles\windows\translucenttb\settings.json -Force
```
