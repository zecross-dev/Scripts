#!/bin/bash

# -----------------------------------------------------------------------------
# Script: installSetup.sh
# Description (EN): Install VSCode, C++ tools, necessary extensions, configure language, and install LibreOffice.
# Description (FR): Installe VSCode, les outils C++, les extensions nécessaires, configure la langue et installe LibreOffice.
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Function: Install necessary dependencies / Installer les dépendances nécessaires
# -----------------------------------------------------------------------------
install_dependencies() {
    echo "Checking and installing required dependencies..."
    echo "Vérification et installation des dépendances nécessaires..."

    # Install curl if not present / Installer curl si absent
    if ! command -v curl &> /dev/null; then
        echo "curl is not installed. Installing..."
        echo "curl n'est pas installé. Installation..."
        sudo apt install curl -y
    fi

    # Install apt-transport-https if not present / Installer apt-transport-https si absent
    if ! dpkg -l | grep -q apt-transport-https; then
        echo "apt-transport-https is not installed. Installing..."
        echo "apt-transport-https n'est pas installé. Installation..."
        sudo apt install apt-transport-https -y
    fi

    # Update package lists / Mettre à jour les dépôts
    sudo apt update -y
}

# -----------------------------------------------------------------------------
# Function: Install Visual Studio Code / Installer Visual Studio Code
# -----------------------------------------------------------------------------
install_vscode() {
    echo "Installing Visual Studio Code..."
    echo "Installation de Visual Studio Code..."

    # Download Microsoft GPG key / Télécharger la clé GPG de Microsoft
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg

    # Add VSCode repository / Ajouter le dépôt VSCode
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    # Update package lists again / Mettre à jour les dépôts à nouveau
    sudo apt update -y

    # Install VSCode / Installer VSCode
    sudo apt install code -y

    echo "Visual Studio Code installed successfully."
    echo "Visual Studio Code installé avec succès."
}

# -----------------------------------------------------------------------------
# Function: Install C++ tools / Installer les outils C++ (g++ et make)
# -----------------------------------------------------------------------------
install_cpp_tools() {
    echo "Installing g++ and make..."
    echo "Installation de g++ et make..."
    sudo apt install g++ make -y
    echo "g++ and make installed successfully."
    echo "g++ et make installés avec succès."
}

# -----------------------------------------------------------------------------
# Function: Install VSCode extensions / Installer les extensions VSCode
# -----------------------------------------------------------------------------
install_vscode_extensions() {
    echo "Installing required VSCode extensions..."
    echo "Installation des extensions VSCode nécessaires..."

    if command -v code &> /dev/null; then
        code --install-extension ms-vscode.cpptools
        code --install-extension ms-vscode.makefile-tools
        code --install-extension MS-CEINTL.vscode-language-pack-fr
        code --install-extension MS-CEINTL.vscode-language-pack-en
        echo "VSCode extensions installed successfully."
        echo "Les extensions VSCode ont été installées avec succès."
    else
        echo "VSCode is not installed, extensions cannot be installed."
        echo "Visual Studio Code n'est pas installé, les extensions ne peuvent pas être installées."
    fi
}

# -----------------------------------------------------------------------------
# Function: Configure VSCode language / Configurer la langue de VSCode
# -----------------------------------------------------------------------------
configure_vscode_language() {
    echo "Choose Visual Studio Code language / Choisissez la langue de Visual Studio Code :"
    echo "1. Français"
    echo "2. English"

    read -p "Enter choice (1 or 2) / Entrez votre choix (1 ou 2): " lang_choice

    if [ "$lang_choice" -eq 1 ]; then
        echo "Configuring VSCode in French / Configuration de VSCode en français..."
        sudo -u "$USER" code --install-extension MS-CEINTL.vscode-language-pack-fr
    elif [ "$lang_choice" -eq 2 ]; then
        echo "Configuring VSCode in English / Configuration de VSCode en anglais..."
        sudo -u "$USER" code --install-extension MS-CEINTL.vscode-language-pack-en
    else
        echo "Invalid choice, defaulting to English / Choix invalide, l'anglais sera utilisé par défaut."
        sudo -u "$USER" code --install-extension MS-CEINTL.vscode-language-pack-en
    fi
}

# -----------------------------------------------------------------------------
# Function: Create VSCode .desktop entry / Créer le raccourci .desktop pour VSCode
# -----------------------------------------------------------------------------
create_vscode_desktop_entry() {
    echo "Creating VSCode desktop shortcut / Création du raccourci VSCode..."

    if [ ! -f /usr/share/applications/vscode.desktop ]; then
        sudo tee /usr/share/applications/vscode.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Visual Studio Code
Comment=Code editing. Redefined.
Exec=code --no-sandbox %F
Icon=com.visualstudio.code
Type=Application
StartupNotify=true
Categories=Utility;TextEditor;Development;
MimeType=text/plain;
EOF
        sudo chmod +x /usr/share/applications/vscode.desktop
    else
        echo "Desktop entry already exists / Le fichier .desktop existe déjà."
    fi
}

# -----------------------------------------------------------------------------
# Main function / Fonction principale
# -----------------------------------------------------------------------------
main() {
    install_dependencies
    install_vscode
    install_cpp_tools
    install_vscode_extensions
    configure_vscode_language
    create_vscode_desktop_entry

    # Install LibreOffice / Installer LibreOffice
    echo "Installing LibreOffice..."
    echo "Installation de la suite LibreOffice..."
    sudo apt install libreoffice -y

    echo "✔ Installation complete! / Installation complète terminée !"
}

# Execute main / Exécution de la fonction principale
main
