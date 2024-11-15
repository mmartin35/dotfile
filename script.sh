#!/bin/bash

function install_sources()
{
    # Arch Linux package manager check
    if command -v pacman &> /dev/null; then
        sudo pacman -Syu --noconfirm zsh git docker docker.io kitty exa bat make cmake valgrind
    elif command -v apt &> /dev/null; then
        # APT sources
        sudo apt update -y
        sudo apt upgrade -y
        sudo apt install -y zsh git docker docker.io kitty exa bat make cmake valgrind
    else
        echo "Unsupported package manager. Please install the required packages manually."
        exit 84
    fi
    sudo chsh -s /bin/zsh
    # Github sources
    git clone https://github.com/neovim/neovim.git "$HOME/.local/share/nvim"
    git clone https://github.com/wbthomason/packer.nvim.git "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    cd "$HOME/.local/share/nvim"
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    nvim +PackerSync +qall
    cd "$HOME"
}

function import_config()
{
    cp "$DOTFILE/config/zshrc" "$HOME/.zshrc"
    cp -r "$DOTFILE/config/nvim/" "$HOME/.config/"
    cp -r "$DOTFILE/config/zsh/" "$HOME/.config/"
}

function export_config()
{
    cp "$HOME/.zshrc" "$DOTFILE/config/zshrc"
    cp -r "$HOME/.config/nvim/" "$DOTFILE/config/"
    cp -r "$HOME/.config/zsh/" "$DOTFILE/config/"
}

function cat_readme()
{
    echo "Dotfile Management Script"
    echo "Usage: ./install.sh <option>"
    echo "  1       Install client configuration"
    echo "  2       Install server configuration"
    echo "  3       Save configuration"
}

if [ $# -eq 1 ]; then
    export DOTFILE="$HOME/Dotfile"
    if [ "$1" = "1" ]; then
        echo "Installing client configuration"
        install_sources
        import_config
    elif [ "$1" = "2" ]; then
        echo "Installing server configuration"
    elif [ "$1" = "3" ]; then
        echo "Saving configuration"
        export_config
    else
        cat_readme
        exit 84
    fi
    echo "Done"
    exit 0
else
    cat_readme
    exit 84
fi
