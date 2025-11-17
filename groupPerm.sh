#!/bin/bash

# -----------------------------------------------------------------------------
# Script: set_group_readonly.sh
# Description (EN): Grant a group read+execute permissions on folders matching the group name without write permissions.
# Description (FR): Donne au groupe les permissions lecture+exécution sur les dossiers correspondant à son nom, sans permission d'écriture.
# Usage (EN/FR): ./set_group_readonly.sh <groupname>
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Variables: Input parameters / Paramètres d'entrée
# -----------------------------------------------------------------------------
GROUP="$1"

if [[ -z "$GROUP" ]]; then
    echo "Usage : $0 <groupname>"
    exit 1
fi

# -----------------------------------------------------------------------------
# Section: Verify group exists / Vérification de l'existence du groupe
# -----------------------------------------------------------------------------
if ! getent group "$GROUP" >/dev/null; then
    echo "❌ Groupe inexistant : $GROUP"
    exit 1
fi

# -----------------------------------------------------------------------------
# Section: Base directories / Dossiers de base
# -----------------------------------------------------------------------------
BASE_DIRS=("/SERVICES" "/PROJETS")

# -----------------------------------------------------------------------------
# Section: Find matching directories and apply permissions / Trouver les dossiers correspondants et appliquer les permissions
# -----------------------------------------------------------------------------
for BASE in "${BASE_DIRS[@]}"; do
    # Recherche récursive des dossiers portant le nom du groupe
    find "$BASE" -type d -name "$GROUP" | while read -r DIR; do
        echo "✔ Dossier trouvé : $DIR"

        # Changer le groupe propriétaire
        chown -R :"$GROUP" "$DIR"

        # Permissions : rwx pour owner, r-x pour groupe, --- pour les autres
        chmod 750 "$DIR"

        echo "✔ Permissions appliquées : lecture+exécution pour $GROUP sur $DIR"
    done
done

echo "✅ Toutes les permissions ont été appliquées pour le groupe $GROUP"

exit 0
