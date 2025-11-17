#!/bin/bash

# -----------------------------------------------------------------------------
# Script: createSkel.sh
# Description (EN): Create a base SKEL environment for future users.
# Description (FR): Crée l'environnement SKEL de base pour les futurs utilisateurs.
# Author / Auteur: tek-it-izy (zecross-dev)
# -----------------------------------------------------------------------------

# CSV file containing users / Fichier CSV contenant les utilisateurs
CSV_FILE="tekitizy_users.csv"

# Base SKEL directory / Répertoire SKEL de base
SKEL="/etc/skel_tekitizy"

# -----------------------------------------------------------------------------
# Check if CSV file exists / Vérification de l'existence du fichier CSV
# -----------------------------------------------------------------------------
if [[ ! -f "$CSV_FILE" ]]; then
    echo "❌ CSV file not found: $CSV_FILE"
    echo "❌ Fichier CSV introuvable : $CSV_FILE"
    exit 1
fi

echo "✔ Creating SKEL template in $SKEL ..."
echo "✔ Création du modèle SKEL dans $SKEL ..."

# -----------------------------------------------------------------------------
# Create user directories / Création de l'arborescence utilisateur
# -----------------------------------------------------------------------------
mkdir -p "$SKEL/Documents"
mkdir -p "$SKEL/Workspace"
mkdir -p "$SKEL/Téléchargements"
mkdir -p "$SKEL/Projets"
mkdir -p "$SKEL/Partage"

# -----------------------------------------------------------------------------
# Create symbolic links to /PROJETS and /SERVICES
# Créer des liens symboliques vers /PROJETS et /SERVICES
# -----------------------------------------------------------------------------
ln -sfn /PROJETS "$SKEL/Projets/PROJETS"
ln -sfn /SERVICES "$SKEL/Partage/SERVICES"

echo "✔ SKEL directory structure created."
echo "✔ Arborescence SKEL construite."

exit 0
