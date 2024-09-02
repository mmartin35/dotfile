#!/bin/bash

create_environment_variables() {
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
build_home() {
    if [ ! -d "$CODE_DIR/epitech" ]; then
        mkdir -p "$CODE_DIR/epitech"
    fi
    if [ ! -d "$CODE_DIR/tools" ]; then
        mkdir -p "$CODE_DIR/tools"
    fi
    if [ ! -d "$SOURCE_DIR" ]; then
        mkdir "$SOURCE_DIR"
    fi
}

function install_sources() {
    # Arch Linux package manager check
    if command -v pacman &> /dev/null; then
        sudo pacman -Syu --noconfirm zsh git docker docker.io kitty exa bat make valgrind cmake gettext crul
    elif command -v apt &> /dev/null; then
        # APT sources
        sudo apt install -y zsh git docker.io kitty exa bat make valgrind cmake gettext curl
    else
        echo "Unsupported package manager. Please install the required packages manually."
        exit 1
    fi

    # Github sources
    if [ ! -d "$SOURCE_DIR/neovim" ]; then
        git clone git@github.com:neovim/neovim.git "$SOURCE_DIR/neovim"
        cd "$SOURCE_DIR/neovim"
        make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
        curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        nvim +PlugInstall +qall
    fi

    if [ ! -d "$SOURCE_DIR/coding-style-checker" ]; then
        git clone git@github.com:epitech/coding-style-checker.git "$SOURCE_DIR/coding-style-checker"
    fi

    # Docker images
    sudo docker pull epitechcontent/epitest-docker
}

export_data_and_preferences() {
    # Export data
    cp -r "$DOTFILE/conf/nvim" "$HOME/.config"
    cp "$DOTFILE/conf/zshrc" "$HOME/.zshrc"
    cp -r "$DOTFILE/conf/zshrc_conf" "$HOME/.config"

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
    cp -r "$DOTFILE/conf/.zshrc_conf" "$HOME/.zshrc_conf"
    sudo chsh -s /bin/zsh
}

update_all() {
    if command -v pacman &> /dev/null; then
        sudo pacman -Syu --noconfirm
    elif command -v apt &> /dev/null; then
        sudo apt update -y
        sudo apt upgrade -y
    fi
}

# Save config
import_data() {
    cp "$HOME/.config/nvim/init.vim" "$DOTFILE/conf/nvim/"
    cp "$HOME/.zshrc" "$DOTFILE/conf/zshrc"
    cp -r "$HOME/.zshrc_conf/" "$DOTFILE/conf/"
}

cat_readme() {
    echo ""
    echo "--------------------------------------------------------"
    echo "               Dotfile Management Script                "
    echo "--------------------------------------------------------"
    echo " Usage: ./install.sh <option>"
    echo " options:"
    echo "   1 : Install gui configuration"
    echo "   2 : Install server configuration"
    echo "   3 : Save configuration"
    echo "   -h: Display this help message"
    echo "--------------------------------------------------------"
}

if [ $# -eq 1 ]; then
    if [ "$1" = "-h" ]; then
        cat_readme
    else
        if [ "$1" = "1" ]; then
            create_environment_variables
            update_all
            build_home
            install_sources
            export_data_and_preferences
            echo "GUI install done"
            exit 0
        elif [ "$1" = "2" ]; then
            echo "Server install done"
            exit 0
        elif [ "$1" = "3" ]; then
            create_environment_variables
            import_data
            echo "Cfg saved in $DOTFILE"
            exit 0
        else
            cat_readme
            exit 84
        fi
    fi
else
    cat_readme
    exit 84
fi
