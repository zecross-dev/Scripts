#!/bin/bash

# -----------------------------------------------------------------------------
# Script: set_permissions.sh
# Description (EN): Manage user permissions based on username and project.
# Description (FR): Gère les permissions des utilisateurs selon le nom d'utilisateur et le projet.
# Usage (EN/FR): ./set_permissions.sh <username> <projet>
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Variables: Input parameters / Paramètres d'entrée
# -----------------------------------------------------------------------------
USER="$1"
PROJET="$2"

# -----------------------------------------------------------------------------
# Section: Check input / Vérification des paramètres
# -----------------------------------------------------------------------------
if [[ -z "$USER" || -z "$PROJET" ]]; then
    echo "Usage : $0 <username> <projet>"
    exit 1
fi

# -----------------------------------------------------------------------------
# Section: Validate project / Vérification du projet
# -----------------------------------------------------------------------------
if [[ ! "$PROJET" =~ ^PROJET_(APOLLO|NOVA|LUMEN|VORTEX|ORION)$ ]]; then
    echo "❌ Projet non reconnu : $PROJET"
    exit 1
fi

PROJET_DIR="~/PROJETS/$PROJET"

# -----------------------------------------------------------------------------
# Section: Ensure project directory exists / Vérifier l'existence du répertoire projet
# -----------------------------------------------------------------------------
if [[ ! -d "$PROJET_DIR" ]]; then
    echo "❌ Le dossier projet n'existe pas : $PROJET_DIR"
    exit 1
fi

# -----------------------------------------------------------------------------
# Section: Ensure project group exists / Vérifier ou créer le groupe projet
# -----------------------------------------------------------------------------
if ! getent group "$PROJET" >/dev/null; then
    echo "✔ Groupe $PROJET créé."
    groupadd "$PROJET"
fi

# -----------------------------------------------------------------------------
# Section: Add user to project group / Ajouter l'utilisateur au groupe projet
# -----------------------------------------------------------------------------
if ! id "$USER" &>/dev/null; then
    echo "ℹ Utilisateur $USER inexistant, création..."
    useradd -m -k /etc/skel_tekitizy -s /bin/bash "$USER"
fi

usermod -aG "$PROJET" "$USER"
echo "✔ $USER ajouté au groupe $PROJET."

# -----------------------------------------------------------------------------
# Section: Set project permissions / Appliquer les permissions sur le projet
# -----------------------------------------------------------------------------
chown -R root:"$PROJET" "$PROJET_DIR"
chmod -R 770 "$PROJET_DIR"
echo "✔ Permissions projet appliquées : rwx pour groupe $PROJET"

# -----------------------------------------------------------------------------
# Section: Set user HOME permissions / Appliquer les permissions sur le HOME utilisateur
# -----------------------------------------------------------------------------
USER_HOME="/home/$USER"

if [[ -d "$USER_HOME" ]]; then
    chmod 700 "$USER_HOME"
    chown -R "$USER":"$PROJET" "$USER_HOME"
    chmod -R o-rwx "$USER_HOME"
fi

echo "✔ Permissions appliquées à $USER_HOME"

exit 0
