#!/bin/bash
# --------------------------------------------------------------
# Script : set_permissions.sh
# Objectif : Gère les permissions utilisateurs selon (username + projet)
# Usage    : ./set_permissions.sh <username> <projet>
# --------------------------------------------------------------

USER="$1"
PROJET="$2"

if [[ -z "$USER" || -z "$PROJET" ]]; then
    echo "Usage : $0 <username> <projet>"
    exit 1
fi

# Vérification projet valide
if [[ ! "$PROJET" =~ ^PROJET_(APOLLO|NOVA|LUMEN|VORTEX|ORION)$ ]]; then
    echo "❌ Projet non reconnu : $PROJET"
    exit 1
fi

PROJET_DIR="/PROJETS/$PROJET"

# --------------------------------------------------------------
# 1. Vérifier l'existence du répertoire projet
# --------------------------------------------------------------
if [[ ! -d "$PROJET_DIR" ]]; then
    echo "❌ Le dossier projet n'existe pas : $PROJET_DIR"
    exit 1
fi

# --------------------------------------------------------------
# 2. Vérifier niveau groupe
# --------------------------------------------------------------
if ! getent group "$PROJET" >/dev/null; then
    echo "✔ Groupe $PROJET créé."
    groupadd "$PROJET"
fi

# --------------------------------------------------------------
# 3. Ajouter l'utilisateur au groupe projet
# --------------------------------------------------------------
if ! id "$USER" &>/dev/null; then
    echo "ℹ Utilisateur $USER inexistant, création..."
    useradd -m -k /etc/skel_tekitizy -s /bin/bash "$USER"
fi

usermod -aG "$PROJET" "$USER"
echo "✔ $USER ajouté au groupe $PROJET."

# --------------------------------------------------------------
# 4. Permissions projet
# --------------------------------------------------------------
chown -R root:"$PROJET" "$PROJET_DIR"
chmod -R 770 "$PROJET_DIR"

echo "✔ Permissions projet appliquées : rwx pour groupe $PROJET"

# --------------------------------------------------------------
# 5. Appliquer permissions HOME utilisateur
# --------------------------------------------------------------
USER_HOME="/home/$USER"

if [[ -d "$USER_HOME" ]]; then
    chmod 700 "$USER_HOME"
    chown -R "$USER":"$PROJET" "$USER_HOME"

    # accès lecture seule pour autres groupes
    chmod -R o-rwx "$USER_HOME"
fi

echo "✔ Permissions appliquées à $USER_HOME"

exit 0
