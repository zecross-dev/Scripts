#!/bin/bash

# Fonction pour afficher un message de bienvenue
welcome_message() {
    echo "Bienvenue dans le script d'installation de Visual Studio Code pour C++."
    echo "Ce script va installer VSCode, g++, make, et configurer le langage de l'interface."
    echo "Vous pouvez choisir entre l'anglais et le français pour l'interface de VSCode."
}

# Fonction pour installer Visual Studio Code
install_vscode() {
    echo "Installation de Visual Studio Code..."

    # Mise à jour des dépôts
    sudo apt update -y

    # Installation de la clé GPG de Microsoft pour les dépôts
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg

    # Ajouter le dépôt de VSCode
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    # Mise à jour des dépôts et installation de VSCode
    sudo apt update -y
    sudo apt install code -y
}

# Fonction pour installer G++ et Make
install_gpp_make() {
    echo "Installation de G++ et Make..."
    sudo apt install g++ make -y
}

# Fonction pour installer les extensions VSCode nécessaires pour C++
install_vscode_extensions() {
    echo "Installation des extensions VSCode pour C++..."
    code --install-extension ms-vscode.cpptools
    code --install-extension ms-vscode.makefile-tools
}

# Fonction pour changer la langue de VSCode
change_language() {
    echo "Choisissez la langue de l'interface de Visual Studio Code:"
    echo "1. Français"
    echo "2. Anglais"
    read -p "Entrez votre choix (1 ou 2): " language_choice

    if [ "$language_choice" == "1" ]; then
        echo "La langue de VSCode sera définie sur Français."
        # Installer le pack de langue français
        code --install-extension MS-CEINTL.vscode-language-pack-fr
    else
        echo "La langue de VSCode sera définie sur Anglais."
        # Installer le pack de langue anglais
        code --install-extension MS-CEINTL.vscode-language-pack-en
    fi
}

# Fonction principale pour lancer l'installation
main() {
    welcome_message
    install_vscode
    install_gpp_make
    install_vscode_extensions
    change_language
    echo "Installation terminée. Vous pouvez maintenant ouvrir Visual Studio Code et commencer à coder en C++."
}

# Exécution du script
main
