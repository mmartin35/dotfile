#! /bin/bash
/bin/clear

#           INSTALL         #

_setup_auths() {
    return
}

_install_soft() {
    return
}

_build_sym_links() {
    return
}

_get_epitech_resources() {
    return
}

_setup_preferencies() {
    return
}

_update_all() {
    return
}

#           SAVE            #

_save_config() {
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
    _setup_auths
    _install_soft
    _build_sym_links
    _get_epitech_resources
    _setup_preferencies
    _update_all
    exit 0
elif [ $status == "save" ]; then
    _save_config
    _push_changes
    exit 0
else
    echo "aborted"
    exit 84
fi
