#!/bin/bash
# --------------------------------------------------------------
# Script : create_skel.sh
# Objectif : Crée l'environnement SKEL de base pour les futurs utilisateurs
# Auteur : tek-it-izy (zecross-dev)
# --------------------------------------------------------------

CSV_FILE="tekitizy_users.csv"
SKEL="/etc/skel_tekitizy"

# --------------------------------------------------------------
# Vérification CSV
# --------------------------------------------------------------
if [[ ! -f "$CSV_FILE" ]]; then
    echo "❌ Fichier CSV introuvable : $CSV_FILE"
    exit 1
fi

echo "✔ Création du modèle SKEL dans $SKEL ..."

# --------------------------------------------------------------
# Arborescence utilisateur
# --------------------------------------------------------------
mkdir -p $SKEL/Documents
mkdir -p $SKEL/Workspace
mkdir -p $SKEL/Téléchargements

mkdir -p $SKEL/Projets
mkdir -p $SKEL/Partage

# --------------------------------------------------------------
# Liens symboliques vers /PROJETS et /SERVICES
# --------------------------------------------------------------
ln -sfn /PROJETS  $SKEL/Projets/PROJETS
ln -sfn /SERVICES $SKEL/Partage/SERVICES

echo "✔ Arborescence SKEL construite."

exit 0
