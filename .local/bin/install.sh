#!/usr/bin/env sh
#
# Script to reinstall dependencies. See `arb`.
#

# shellcheck source=/dev/null disable=SC2002
base="$HOME/.config/pkglist"

split() {
    # Disable globbing.
    # This ensures that the word-splitting is safe.
    set -f

    # Store the current value of 'IFS' so we
    # can restore it later.
    old_ifs=$IFS

    # Change the field separator to what we're
    # splitting on.
    IFS=$2

    # Create an argument list splitting at each
    # occurance of '$2'.
    #
    # This is safe to disable as it just warns against
    # word-splitting which is the behavior we expect.
    # shellcheck disable=2086
    set -- $1

    # Print each list value on its own line.
    printf '%s\n' "$@"

    # Restore the value of 'IFS'.
    IFS=$old_ifs

    # Re-enable globbing.
    set +f
}

err() {
    printf '%s\n' "$1"
    exit 1
}

usg() {
    printf '%s\n' "usage arr [arguments]"
    printf '\n'
    printf '%s\n' "Options"
    printf '\t%s\n' "-t - required, either 'laptop' or 'desktop'"
    printf '\t%s\n' "-a - install apm packages"
    printf '\t%s\n' "-g - install gems packages"
    printf '\t%s\n' "-n - install npm packages"
    printf '\t%s\n' "-p - install pacman packages"
    printf '\t%s\n' "-y - install yay with aur packages"
    printf '\t%s\n' "-c - clone dots project"
    printf '\t%s\n' "-l - install suckless tools"
    printf '\t%s\n' "-s - apply shell changes"
    printf '\t%s\n' "-h - display this"
    exit
}

install_pacman() {
    if [ -n "$pacmanflag" ]; then
        printf '%s\n' "installing pacman packages..."
        cat "$base/pacman-$type.lst" | xargs sudo pacman -S --needed --noconfirm \
            > /dev/null 2>&1
    fi
}

install_yay() {
    if [ -n "$yayflag" ]; then
        printf '%s\n' "installing yay..."

        aur="https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h="

        curl "${aur}yay" -o PKGBUILD -s
        makepkg -si --noconfirm

        rm -rf src pkg yay* PKGBUILD

        printf '%s\n' "installing yay packages..."
        cat "$base/yay-$type.lst" | xargs yay -S --noconfirm
    fi
}

install_npm() {
    if [ -n "$npmflag" ]; then
        printf '%s\n' "installing nvm, npm & node..."
        mkdir -p ~/.config/nvm
        nvm="https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh"
        curl -o- "$nvm" | bash
        . ~/.bashrc

        nvm install stable
        nvm use stable
    fi
}

install_apm() {
    if [ -n "$apmflag" ]; then
        printf '%s\n' "installing npm & apm packages..."
        [ -n "$(command -v apm)" ] && cat "$base/apm-$type.lst" | apm install
        [ -n "$(command -v npm)" ] && \
            cat "$base/npm-$type.list"  | sudo npm install -g
    fi
}

install_gems() {
    if [ -n "$gemsflag" ]; then
        printf '%s\n' "installing gems..."
        [ -n "$(command -v gem)" ] && \
            cat "$base/gems-$type.lst" | xargs gem install
    fi
}

install_shell() {
    if [ -n "$shellflag" ]; then
        if [ -z "$(command -v zsh)" ]; then
            sudo pacman -S --needed --noconfirm zsh > /dev/null 2>&1
        fi
        printf '%s\n' "Setting default shell as zsh"
        sudo chsh -s /usr/bin/zsh "$USER" > /dev/null 2>&1

        if [ -z "$(command -v dash)" ]; then
            sudo pacman -S --needed --noconfirm dash >/dev/null 2>&1
        fi
        printf '%s\n' "Setting default shell as zsh"
        sudo ln -sfT dash /usr/bin/sh
    fi
}

install_suckless_tool() {
    printf '\t- %s\t' "$1"

    workdir="$HOME/Software/$1"
    if [ ! -d "$workdir" ]; then
        link="https://github.com/SCThijsse/$1.git"
        git clone --quiet "$link" "$workdir" > /dev/null
    fi

    find "$workdir/patches/" -type f -print0 | sort -z | \
      xargs -n 1 -0 patch -Np1 -i >/dev/null 2>&1
    sudo make -C "$workdir" --quiet clean install > /dev/null 2>&1

    printf 'done\n'
}

install_suckless() {
    if [ -n "$suckless" ]; then
        printf '%s\n' "installing suckless tools..."
        mkdir -p "$HOME/Software"

        tools="$(split "$suckless" ",")"
        printf '%s' "$tools" | while IFS= read -r tool || [ -n "$tool" ]; do
            install_suckless_tool "$tool"
        done
    fi
}

install_deps() {
    sudo pacman -S --needed --noconfirm git patch > /dev/null 2>&1
}

clone_project() {
    if [ -n "$cloneflag" ]; then
        project="dots"
        link="https://github.com/SCThijsse/$project.git"
        git clone --quiet "$link" "$HOME/$project" > /dev/null

        mv "$HOME/$project/"* "$HOME/"
        mv "$HOME/$project/".[!.]* "$HOME/"
        rm -rf "${HOME:?}/$project"
    fi
}

main() {
    while getopts ":acghl:npst:y" opt; do
        case "$opt" in
            t)  type="$OPTARG" ;;
            a)  apmflag="true" ;;
            c)  cloneflag="true" ;;
            g)  gemsflag="true" ;;
            l)  suckless="$OPTARG" ;;
            n)  npmflag="true" ;;
            p)  pacmanflag="true" ;;
            s)  shellflag="true" ;;
            y)  yayflag="true" ;;
            h)  usg ;;
            \?) err "invalid option: -$OPTARG" >&2 ;;
            :)  err "option -$OPTARG requires an argument" >&2 ;;
        esac
    done

    # throw errors when needed
    [ "$type" != "laptop" ] && [ "$type" != "desktop" ] && \
        err "error: -t flag argument can only be 'laptop' or 'desktop'"

    install_deps
    clone_project

    install_pacman
    install_yay
    install_npm
    install_apm
    install_gems
    install_suckless
    install_shell

    printf '%s\n' "finished."
}

main "$@"
