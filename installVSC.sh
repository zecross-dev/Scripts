#!/bin/bash

# Fonction pour installer Visual Studio Code
install_vscode() {
    echo "Installation de Visual Studio Code..."

    # Mise à jour des dépôts
    sudo apt update -y

    # Installation de la clé GPG de Microsoft pour les dépôts
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg

    # Ajouter le dépôt de VSCode
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    # Mettre à jour les dépôts
    sudo apt update -y

    # Installer Visual Studio Code
    sudo apt install code -y

    echo "Visual Studio Code installé avec succès."
}

# Fonction pour installer g++ et make
install_cpp_tools() {
    echo "Installation de g++ et make..."

    # Installer g++ et make
    sudo apt install g++ make -y

    echo "g++ et make installés avec succès."
}

# Fonction pour installer les extensions VSCode nécessaires pour le développement C++
install_vscode_extensions() {
    echo "Installation des extensions VSCode nécessaires..."

    # Installer les extensions pour C++ et Makefile
    code --install-extension ms-vscode.cpptools
    code --install-extension ms-vscode.makefile-tools
    code --install-extension MS-CEINTL.vscode-language-pack-fr
    code --install-extension MS-CEINTL.vscode-language-pack-en

    echo "Les extensions VSCode ont été installées avec succès."
}

# Fonction principale pour lancer l'installation complète
main() {
    # Installer VSCode
    install_vscode

    # Installer g++ et make
    install_cpp_tools

    # Installer les extensions VSCode
    install_vscode_extensions

    echo "Installation complète terminée."
}

# Exécution du script
main
