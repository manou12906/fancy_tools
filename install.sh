#!/bin/bash
set -e

REPO_URL="https://github.com/manou12906/fancy_tools.git"
SRC_DIR="$HOME/src/fancy_tools"

echo "🔧 Installation Fancy Tools..."

# Sauvegarde bashrc
cp ~/.bashrc ~/.bashrc.bak.$(date +%s)

# Fonction utilitaire
add_if_missing() {
    grep -qxF "$1" ~/.bashrc || echo "$1" >> ~/.bashrc
}

# Ajouter sources
add_if_missing "source $SRC_DIR/.aliases"
add_if_missing "source $SRC_DIR/fancy_functions.sh"

# Ajouter ~/bin au PATH
add_if_missing 'export PATH="$HOME/bin:$PATH"'

# Créer dossier src si besoin
mkdir -p ~/src

# Cloner si absent
if [ ! -d "$SRC_DIR" ]; then
    git clone "$REPO_URL" "$SRC_DIR"
fi

echo " Installation terminée. Redémarre ton terminal."
