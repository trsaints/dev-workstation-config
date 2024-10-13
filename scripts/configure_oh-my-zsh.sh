#!/bin/bash

download_status=$(git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1)

if [ "$download_status" != "Cloning into '$ZSH_CUSTOM/themes/spaceship-prompt'..." ]; then
    echo "Error: Spaceship prompt theme could not be downloaded."
    exit 1
fi

link_status=$(ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme")

if [ "$link_status" == "ln: failed to create symbolic link '$ZSH_CUSTOM/themes/spaceship.zsh-theme': File exists" ]; then
    echo "Error: Spaceship prompt theme could not be linked."
    exit 1
fi

curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh

