#!/usr/bin/env sh
#
# Script to reinstall dependencies. See `arb`.
#

# shellcheck source=/dev/null disable=SC2002
base="$HOME/.config/pkglist"

split() {
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
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
        cat "$base/pacman-$type.lst" | xargs sudo pacman -S --needed --noconfirm
            > /dev/null 2>&1
    fi
}

install_yay() {
    if [ -n "$yayflag" ]; then
        printf '%s\n' "installing yay..."

        aur="https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h="

        curl "${aur}yay" -o PKGBUILD -s
        makepkg -si --noconfirm

        rm -Rf src pkg yay* PKGBUILD

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
    if [ ! -n "$(command -v zsh)" ]; then
        sudo pacman -S --needed --noconfirm zsh > /dev/null 2>&1
    fi
    printf '%s\n' "Setting default shell as zsh"
    sudo chsh -s /usr/bin/zsh "$USER"

    if [ ! -n "$(command -v dash)" ]; then
        sudo pacman -S --needed --noconfirm dash >/dev/null 2>&1
    fi
    printf '%s\n' "Setting default shell as zsh"
    ln -sfT dash /usr/bin/sh
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
        mapfile -t tools < <(split "$suckless" ",")

        for tool in "${tools[@]}"; do
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
        cp -r "$HOME/dots" "$HOME"
        rm -rf "$HOME/dots"
    fi
}

main() {
    while getopts ":ad:cghlnps:t:y" opt; do
        case "$opt" in
            t)  type="$OPTARG" ;;
            a)  apmflag="true" ;;
            c)  cloneflag="true" ;;
            g)  gemsflag="true" ;;
            l)  suckless="$OPTARG" ;;
            n)  npmflag="true" ;;
            p)  pacmanflag="true" ;;
            s)  shell="true" ;;
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
