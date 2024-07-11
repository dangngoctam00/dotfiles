# Dotfiles
A set of file for configuring terminal and neovim

## Color theme for terminal 
/usr/share/xfce4/terminal/colorschemes

## Macos

### Zsh

```bash
    export ZSH="$HOME/.oh-my-zsh"
    export 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

### Alacrity

Install theme:

```bash
    mkdir -p ~/.config/alacritty/themes
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

Config file `$HOME/.config/alacritty/alacrity.toml`:

```yml
    import = [
    "~/.config/alacritty/themes/themes/gruvbox_dark.toml"
    ]

    [font]
    size = 15

    [keyboard]
    bindings = [
        { key = "Right", mods = "Alt", chars = "\u001BF" },
        { key = "Left",  mods = "Alt", chars = "\u001BB" },
    ]
```

### Fzf

Install using git

```bash
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    # Set up fzf key bindings and fuzzy completion
    source <(fzf --zsh)
```

### NeoVim

Install autoload

```bash
    curl -fLo ~/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Go to `dotfiles` folder and create symlink:

```bash
    rm -rf $HOME/.config/nvim/init.vim
    rm -rf $HOME/.config/nvim
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s $(pwd)/nvim $XDG_CONFIG_HOME/nvim
```

Open file `init.vim` and run `:PlugInstall` to install plugin.

### Others

prompt: https://github.com/spaceship-prompt/spaceship-prompt/wiki/Presets
