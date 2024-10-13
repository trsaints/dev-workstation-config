#!/bin/bash

# Log file
LOG_FILE="/tmp/configure_oh_my_zsh.log"

# Clone the repository
echo "Cloning repository..." | tee -a "$LOG_FILE"
download_status=$(git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1 2>&1 | tee -a "$LOG_FILE")

# Create symbolic link
echo "Creating symbolic link..." | tee -a "$LOG_FILE"
link_status=$(ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 2>&1 | tee -a "$LOG_FILE")

# Download and install zinit
echo "Installing zinit..." | tee -a "$LOG_FILE"
curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh | tee -a "$LOG_FILE"

# Copy .zshrc
echo "Copying .zshrc..." | tee -a "$LOG_FILE"
cp '../.zshrc' "$HOME/.zshrc" --force | tee -a "$LOG_FILE"