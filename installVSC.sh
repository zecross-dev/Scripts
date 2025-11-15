#!/bin/bash

# Fonction pour installer les dépendances nécessaires
install_dependencies() {
    echo "Vérification et installation des dépendances nécessaires..."

    # Installer curl si ce n'est pas déjà fait
    if ! command -v curl &> /dev/null; then
        echo "curl n'est pas installé. Installation..."
        sudo apt install curl -y
    fi

    # Installer apt-transport-https si ce n'est pas déjà fait
    if ! dpkg -l | grep -q apt-transport-https; then
        echo "apt-transport-https n'est pas installé. Installation..."
        sudo apt install apt-transport-https -y
    fi

    # Mettre à jour les dépôts
    sudo apt update -y
}

# Fonction pour installer Visual Studio Code
install_vscode() {
    echo "Installation de Visual Studio Code..."

    # Télécharger et installer la clé GPG de Microsoft pour les dépôts
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg

    # Ajouter le dépôt de Visual Studio Code
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    # Mettre à jour les dépôts à nouveau
    sudo apt update -y

    # Installer VSCode
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

# Fonction pour installer les extensions de VSCode nécessaires pour le développement C++
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

# Fonction pour configurer le langage de VSCode
configure_vscode_language() {
    echo "Choisissez la langue de Visual Studio Code :"
    echo "1. Français"
    echo "2. Anglais"

    read -p "Entrez votre choix (1 ou 2): " lang_choice

    if [ "$lang_choice" -eq 1 ]; then
        echo "Configuration de VSCode en français..."
        # Installer le pack de langue français pour VSCode
        sudo -u $USER code --install-extension MS-CEINTL.vscode-language-pack-fr
    elif [ "$lang_choice" -eq 2 ]; then
        echo "Configuration de VSCode en anglais..."
        # Installer le pack de langue anglais pour VSCode
        sudo -u $USER code --install-extension MS-CEINTL.vscode-language-pack-en
    else
        echo "Choix invalide, l'anglais sera utilisé par défaut."
        # Installer le pack de langue anglais pour VSCode par défaut
        sudo -u $USER code --install-extension MS-CEINTL.vscode-language-pack-en
    fi
}

# Fonction pour créer un fichier .desktop pour VSCode (si ce n'est pas déjà fait)
create_vscode_desktop_entry() {
    echo "Création du raccourci VSCode dans le menu des applications..."

    # Vérifier si le fichier .desktop existe
    if [ ! -f /usr/share/applications/vscode.desktop ]; then
        # Créer le fichier .desktop pour VSCode
        echo "[Desktop Entry]
Name=Visual Studio Code
Comment=Code editing. Redefined.
Exec=code --no-sandbox %F
Icon=com.visualstudio.code
Type=Application
StartupNotify=true
Categories=Utility;TextEditor;Development;
MimeType=text/plain;" | sudo tee /usr/share/applications/vscode.desktop > /dev/null

        # Rendre le fichier exécutable
        sudo chmod +x /usr/share/applications/vscode.desktop
    else
        echo "Le fichier .desktop existe déjà."
    fi
}

# Fonction principale pour exécuter l'installation
main() {
    # Installer les dépendances nécessaires
    install_dependencies

    # Installer Visual Studio Code
    install_vscode

    # Installer g++ et make
    install_cpp_tools

    # Installer les extensions pour VSCode
    install_vscode_extensions

    # Configurer la langue de VSCode
    configure_vscode_language

    # Créer un raccourci .desktop si nécessaire
    create_vscode_desktop_entry

    echo "Installation complète terminée ! Visual Studio Code est installé et configuré."
}

# Exécution du script
main
