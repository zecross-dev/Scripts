#!/bin/bash

# Fonction pour installer les dépendances nécessaires
install_dependencies() {
    echo "Vérification et installation des dépendances nécessaires..."

    # Vérifier si curl est installé, sinon l'installer
    if ! command -v curl &> /dev/null; then
        echo "curl n'est pas installé. Installation en cours..."
        sudo apt install curl -y
    fi

    # Vérifier si apt-transport-https est installé, sinon l'installer
    if ! dpkg -l | grep -q apt-transport-https; then
        echo "apt-transport-https n'est pas installé. Installation en cours..."
        sudo apt install apt-transport-https -y
    fi

    # Vérifier si code est installé (VSCode), sinon l'installer
    if ! command -v code &> /dev/null; then
        echo "VSCode n'est pas installé. Installation en cours..."
        # Mettre à jour les dépôts
        sudo apt update -y

        # Installer la clé GPG de Microsoft
        curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg

        # Ajouter le dépôt de VSCode
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

        # Mettre à jour les dépôts à nouveau
        sudo apt update -y

        # Installer VSCode
        sudo apt install code -y
    else
        echo "Visual Studio Code est déjà installé."
    fi

    # Vérifier si g++ est installé, sinon l'installer
    if ! command -v g++ &> /dev/null; then
        echo "g++ n'est pas installé. Installation en cours..."
        sudo apt install g++ -y
    fi

    # Vérifier si make est installé, sinon l'installer
    if ! command -v make &> /dev/null; then
        echo "make n'est pas installé. Installation en cours..."
        sudo apt install make -y
    fi

    echo "Toutes les dépendances nécessaires sont maintenant installées."
}

# Fonction pour installer les extensions de VSCode
install_vscode_extensions() {
    echo "Installation des extensions VSCode nécessaires..."

    # Vérifier si VSCode est installé
    if command -v code &> /dev/null; then
        # Installer les extensions pour C++ et Makefile
        code --install-extension ms-vscode.cpptools
        code --install-extension ms-vscode.makefile-tools
        code --install-extension MS-CEINTL.vscode-language-pack-fr
        code --install-extension MS-CEINTL.vscode-language-pack-en

        echo "Les extensions VSCode ont été installées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, les extensions ne peuvent pas être installées."
    fi
}

# Fonction principale pour installer VSCode et les outils nécessaires
main() {
    # Installer les dépendances nécessaires
    install_dependencies

    # Installer les extensions VSCode
    install_vscode_extensions

    echo "Installation complète terminée."
}

# Exécution du script
main
