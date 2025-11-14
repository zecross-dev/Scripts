#!/bin/bash

# Fonction pour installer Visual Studio Code (si ce n'est pas déjà installé)
install_vscode() {
    if ! command -v code &> /dev/null; then
        echo "Visual Studio Code n'est pas installé. Installation en cours..."
        
        # Mise à jour des dépôts
        sudo apt update -y
        
        # Installation de la clé GPG de Microsoft pour les dépôts
        curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg
        
        # Ajouter le dépôt de VSCode
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        
        # Mise à jour des dépôts et installation de VSCode
        sudo apt update -y
        sudo apt install code -y
    else
        echo "Visual Studio Code est déjà installé."
    fi
}

# Fonction pour installer les extensions nécessaires
install_vscode_extensions() {
    echo "Installation des extensions VSCode nécessaires..."

    # Installation des extensions pour C++ et Makefile
    code --install-extension ms-vscode.cpptools
    code --install-extension ms-vscode.makefile-tools
    # Assurez-vous d'installer également le pack de langue par défaut (en) si nécessaire
    code --install-extension MS-CEINTL.vscode-language-pack-en
}

# Fonction pour installer g++ et make
install_gpp_make() {
    echo "Installation de g++ et make..."
    sudo apt install g++ make -y
}

# Fonction principale pour lancer l'installation
main() {
    # Installer VSCode si nécessaire et les extensions requises
    install_vscode
    install_vscode_extensions
    
    # Installer g++ et make
    install_gpp_make
    
    echo "Installation terminée. Vous pouvez maintenant utiliser Visual Studio Code pour coder en C++."
}

# Exécution du script
main

