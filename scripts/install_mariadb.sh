#!/bin/bash

sudo apt-get install apt-transport-https curl
sudo mkdir -p /etc/apt/keyrings
sudo curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_FILE="$SCRIPT_DIR/config/mariadb.sources"
DEST_DIR="/etc/apt/sources.list.d"

sudo cp "$SOURCE_FILE" "$DEST_DIR"
sudo apt-get update
sudo apt-get install mariadb-server