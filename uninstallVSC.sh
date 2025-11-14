#!/bin/bash

# Fonction pour vérifier si VSCode est installé
is_vscode_installed() {
    if command -v code &> /dev/null; then
        return 0  # VSCode est installé
    else
        return 1  # VSCode n'est pas installé
    fi
}

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

    # Vérifier si VSCode est installé avant de tenter de supprimer les extensions
    if is_vscode_installed; then
        # Si VSCode est installé, on désinstalle les extensions via la commande `code`
        code --uninstall-extension ms-vscode.cpptools
        code --uninstall-extension ms-vscode.makefile-tools
        code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
        code --uninstall-extension MS-CEINTL.vscode-language-pack-en
        echo "Les extensions ont été désinstallées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, donc aucune extension n'a été désinstallée."
    fi
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions si VSCode est installé
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
#!/bin/bash

# Fonction pour vérifier si VSCode est installé
is_vscode_installed() {
    if command -v code &> /dev/null; then
        return 0  # VSCode est installé
    else
        return 1  # VSCode n'est pas installé
    fi
}

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

    # Vérifier si VSCode est installé avant de tenter de supprimer les extensions
    if is_vscode_installed; then
        # Si VSCode est installé, on désinstalle les extensions via la commande `code`
        code --uninstall-extension ms-vscode.cpptools
        code --uninstall-extension ms-vscode.makefile-tools
        code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
        code --uninstall-extension MS-CEINTL.vscode-language-pack-en
        echo "Les extensions ont été désinstallées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, donc aucune extension n'a été désinstallée."
    fi
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions si VSCode est installé
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
#!/bin/bash

# Fonction pour vérifier si VSCode est installé
is_vscode_installed() {
    if command -v code &> /dev/null; then
        return 0  # VSCode est installé
    else
        return 1  # VSCode n'est pas installé
    fi
}

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

    # Vérifier si VSCode est installé avant de tenter de supprimer les extensions
    if is_vscode_installed; then
        # Si VSCode est installé, on désinstalle les extensions via la commande `code`
        code --uninstall-extension ms-vscode.cpptools
        code --uninstall-extension ms-vscode.makefile-tools
        code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
        code --uninstall-extension MS-CEINTL.vscode-language-pack-en
        echo "Les extensions ont été désinstallées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, donc aucune extension n'a été désinstallée."
    fi
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions si VSCode est installé
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
#!/bin/bash

# Fonction pour vérifier si VSCode est installé
is_vscode_installed() {
    if command -v code &> /dev/null; then
        return 0  # VSCode est installé
    else
        return 1  # VSCode n'est pas installé
    fi
}

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

    # Vérifier si VSCode est installé avant de tenter de supprimer les extensions
    if is_vscode_installed; then
        # Si VSCode est installé, on désinstalle les extensions via la commande `code`
        code --uninstall-extension ms-vscode.cpptools
        code --uninstall-extension ms-vscode.makefile-tools
        code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
        code --uninstall-extension MS-CEINTL.vscode-language-pack-en
        echo "Les extensions ont été désinstallées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, donc aucune extension n'a été désinstallée."
    fi
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions si VSCode est installé
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
#!/bin/bash

# Fonction pour vérifier si VSCode est installé
is_vscode_installed() {
    if command -v code &> /dev/null; then
        return 0  # VSCode est installé
    else
        return 1  # VSCode n'est pas installé
    fi
}

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

    # Vérifier si VSCode est installé avant de tenter de supprimer les extensions
    if is_vscode_installed; then
        # Si VSCode est installé, on désinstalle les extensions via la commande `code`
        code --uninstall-extension ms-vscode.cpptools
        code --uninstall-extension ms-vscode.makefile-tools
        code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
        code --uninstall-extension MS-CEINTL.vscode-language-pack-en
        echo "Les extensions ont été désinstallées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, donc aucune extension n'a été désinstallée."
    fi
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions si VSCode est installé
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
#!/bin/bash

# Fonction pour vérifier si VSCode est installé
is_vscode_installed() {
    if command -v code &> /dev/null; then
        return 0  # VSCode est installé
    else
        return 1  # VSCode n'est pas installé
    fi
}

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

    # Vérifier si VSCode est installé avant de tenter de supprimer les extensions
    if is_vscode_installed; then
        # Si VSCode est installé, on désinstalle les extensions via la commande `code`
        code --uninstall-extension ms-vscode.cpptools
        code --uninstall-extension ms-vscode.makefile-tools
        code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
        code --uninstall-extension MS-CEINTL.vscode-language-pack-en
        echo "Les extensions ont été désinstallées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, donc aucune extension n'a été désinstallée."
    fi
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions si VSCode est installé
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
#!/bin/bash

# Fonction pour vérifier si VSCode est installé
is_vscode_installed() {
    if command -v code &> /dev/null; then
        return 0  # VSCode est installé
    else
        return 1  # VSCode n'est pas installé
    fi
}

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

    # Vérifier si VSCode est installé avant de tenter de supprimer les extensions
    if is_vscode_installed; then
        # Si VSCode est installé, on désinstalle les extensions via la commande `code`
        code --uninstall-extension ms-vscode.cpptools
        code --uninstall-extension ms-vscode.makefile-tools
        code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
        code --uninstall-extension MS-CEINTL.vscode-language-pack-en
        echo "Les extensions ont été désinstallées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, donc aucune extension n'a été désinstallée."
    fi
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions si VSCode est installé
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
#!/bin/bash

# Fonction pour vérifier si VSCode est installé
is_vscode_installed() {
    if command -v code &> /dev/null; then
        return 0  # VSCode est installé
    else
        return 1  # VSCode n'est pas installé
    fi
}

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

    # Vérifier si VSCode est installé avant de tenter de supprimer les extensions
    if is_vscode_installed; then
        # Si VSCode est installé, on désinstalle les extensions via la commande `code`
        code --uninstall-extension ms-vscode.cpptools
        code --uninstall-extension ms-vscode.makefile-tools
        code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
        code --uninstall-extension MS-CEINTL.vscode-language-pack-en
        echo "Les extensions ont été désinstallées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, donc aucune extension n'a été désinstallée."
    fi
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions si VSCode est installé
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
#!/bin/bash

# Fonction pour vérifier si VSCode est installé
is_vscode_installed() {
    if command -v code &> /dev/null; then
        return 0  # VSCode est installé
    else
        return 1  # VSCode n'est pas installé
    fi
}

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

    # Vérifier si VSCode est installé avant de tenter de supprimer les extensions
    if is_vscode_installed; then
        # Si VSCode est installé, on désinstalle les extensions via la commande `code`
        code --uninstall-extension ms-vscode.cpptools
        code --uninstall-extension ms-vscode.makefile-tools
        code --uninstall-extension MS-CEINTL.vscode-language-pack-fr
        code --uninstall-extension MS-CEINTL.vscode-language-pack-en
        echo "Les extensions ont été désinstallées avec succès."
    else
        echo "Visual Studio Code n'est pas installé, donc aucune extension n'a été désinstallée."
    fi
}

# Fonction principale pour lancer la désinstallation
main() {
    # Désinstaller les extensions si VSCode est installé
    uninstall_vscode_extensions
    
    # Désinstaller VSCode et ses outils
    uninstall_vscode

    echo "Désinstallation terminée."
}

# Exécution du script
main
