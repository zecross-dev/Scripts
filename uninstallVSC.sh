#!/bin/bash

# Fonction pour désinstaller Visual Studio Code et ses dépendances
uninstall_vscode() {
    echo "Désinstallation de Visual Studio Code..."

    # Désinstaller VSCode
    sudo apt remove --purge code -y

    # Désinstaller g++ et make
    sudo apt remove --purge g++ make -y

    # Supprimer les dépendances inutilisées
    sudo apt autoremove -y

    # Supprimer les fichiers de configuration utilisateurs de VSCode
    rm -rf ~/.config/Code
    rm -rf ~/.vscode

    # Supprimer le dépôt de Microsoft
    sudo rm /etc/apt/sources.list.d/vscode.list

    # Supprimer la clé GPG de Microsoft
    sudo rm /usr/share/keyrings/microsoft-archive-keyring.gpg

    # Mettre à jour les dépôts
    sudo apt update -y

    echo "Visual Studio Code, g++, make et les configurations ont été supprimés avec succès."
}

# Fonction pour supprimer les extensions de VSCode
uninstall_vscode_extensions() {
    echo "Désinstallation des extensions VSCode..."
    code --uninstall-extension ms-vscode.cpptools
    code --uninstall-extension ms-vscode.makefile-tools
    code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
    code --uninstall-extension MS-CEINTL.vscode-language-pack-en
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
