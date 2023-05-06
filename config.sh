#! /bin/bash
/bin/clear

_install_nvim_fs() {
    return
}

#           INSTALL         #

_build_dirs() {
    return
}

_setup_auths() {
    # ssh key #
    ssh-keygen -f %HOME/.ssh/ssh_auth -N ""
    return
}

_install_soft() {
    sudo apt install zsh git docker.io kitty
    _install_nvim_fs
    return
}

_get_epitech_resources() {
    sudo docker pull epitechcontent/epitest-docker
    return
}

_setup_preferencies() {
    cp -r $PWD/config/nvim $HOME/.config

    cp $PWD/dot/zshrc $HOME/.zshrc
    cp -r $PWD/dot/zshrc_conf $HOME/.zshrc_conf
    return
}

_build_sym_links() {
    # scripts #
    sudo ln -s $PWD/scripts/git/auto_commit.sh /usr/local/bin/auto_commit
    sudo ln -s $PWD/scripts/headers/epitech_header.sh /usr/local/bin/header
    sudo ln -s $PWD/scripts/tests/coding_style.sh /usr/local/bin/coding-style

    exa /usr/local/bin
    return
}

_update_all() {
    sudo apt update
    sudo apt upgrade
    return
}

#           SAVE            #

_save_config() {
    cd $HOME/GIT/dotfile
    cp $HOME/.config/nvim/init.vim $PWD/config/nvim/

    cp $HOME/.zshrc $PWD/dot/zshrc
    cp -r $HOME/.zshrc_conf/* $PWD/dot/zshrc_conf/
    return
}

_push_changes() {
    return
}

echo "Setup dotfile ? (y/save/a)"
read status
if [ -z $status ]; then
    echo "aborted"
    exit 84
fi
if [ $status == "y" ]; then
    _build_dirs
    _setup_auths
    _install_soft
    _get_epitech_resources
    _setup_preferencies
    _build_sym_links
    _update_all
    echo "Install done."
    exit 0
elif [ $status == "save" ]; then
    _save_config
    _push_changes
    echo "Save done."
    exit 0
else
    echo "aborted"
    exit 84
fi
