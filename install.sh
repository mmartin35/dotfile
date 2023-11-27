#!/bin/bash

function create_environment_variables() {
    # Check and create environment variables
    if [ -z "$DOTFILE" ]; then
        export DOTFILE="$HOME/Dotfile" # Where Dotfile is
    fi

    if [ -z "$SOURCE_DIR" ]; then
        export SOURCE_DIR="$HOME/Sources" # Where downloaded sources are
    fi

    if [ -z "$CODE_DIR" ]; then
        export CODE_DIR="$HOME/Code" # Where coding workspace is
    fi
}

# Install config
function build_home() {
    if [ ! -d "$HOME/$CODE_DIR/epitech" ]; then
        mkdir -p "$HOME/$CODE_DIR/epitech"
    fi

    if [ ! -d "$HOME/$CODE_DIR/tools" ]; then
        mkdir -p "$HOME/$CODE_DIR/tools"
    fi

    if [ ! -d "$HOME/$SOURCE_DIR" ]; then
        mkdir "$HOME/$SOURCE_DIR"
    fi
}

function install_sources() {
    # APT sources
    sudo apt install zsh git docker.io kitty exa bat

    # Github sources
    if [ ! -d "$HOME/$SOURCE_DIR/neovim" ]; then
        git clone git@github.com:neovim/neovim.git "$HOME/$SOURCE_DIR/neovim"
        cd "$HOME/$SOURCE_DIR/neovim"
        make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
    fi

    if [ ! -d "$HOME/$SOURCE_DIR/coding-style-checker" ]; then
        git clone git@github.com:epitech/coding-style-checker.git "$HOME/$SOURCE_DIR/coding-style-checker"
    fi

    # Docker images
    sudo docker pull epitechcontent/epitest-docker
}

function export_data_and_preferences() {
    # Export data
    cp "$DOTFILE/conf/*" "$HOME/.config"

    # Scripts (symlinks)
    if [ ! -e "/usr/local/bin/auto_commit" ]; then
        sudo ln -s "$DOTFILE/scripts/git/auto_commit.sh" "/usr/local/bin/auto_commit"
    fi

    if [ ! -e "/usr/local/bin/header" ]; then
        sudo ln -s "$DOTFILE/scripts/headers/epitech_header.sh" "/usr/local/bin/header"
    fi

    exa /usr/local/bin

    # Preferences
    cp -r "$DOTFILE/conf/nvim" "$HOME/.config"
    cp "$DOTFILE/conf/zshrc" "$HOME/.zshrc"
    cp -r "$DOTFILE/conf/zshrc_conf" "$HOME/.zshrc_conf"
}

function update_all() {
    sudo apt update
    sudo apt upgrade
}

# Save config
function import_data() {
    cp "$HOME/.config/nvim/init.vim" "$DOTFILE/conf/nvim/"
    cp "$HOME/.zshrc" "$DOTFILE/conf/zshrc"
    cp -r "$HOME/.zshrc_conf/" "$DOTFILE/conf/zshrc_conf/"
}

function cat_readme() {
    echo ""
    echo "Usage: ./test.sh <option>"
    echo "options:"
    echo "1 : install config"
    echo "2 : save config"
}

/bin/clear
if [ $# == 1 ]; then
    if [ $1 == "-h" ]; then
        cat_readme
    else
        if [ $1 == "1" ]; then
            create_environment_variables
            update_all
            build_home
            install_sources
            export_data_and_preferences
            echo "Installation done..."
            exit 0
        elif [ $1 == "2" ]; then
            import_data
            echo "Saving done..."
            exit 0
        else
            cat_readme
        fi
    fi
else
    cat_readme
fi
