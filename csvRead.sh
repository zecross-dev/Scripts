#!/bin/bash

# -----------------------------------------------------------------------------
# Script: processCSV.sh
# Description (EN): Read the CSV file of users and create each user via createUserGroup.sh.
# Description (FR): Lit le fichier CSV des utilisateurs et crée chaque utilisateur via createUserGroup.sh.
# -----------------------------------------------------------------------------

CSV_FILE="tekitizy_users.csv"

# -----------------------------------------------------------------------------
# Check if CSV file exists / Vérification de l'existence du CSV
# -----------------------------------------------------------------------------
if [[ ! -f "$CSV_FILE" ]]; then
    echo "❌ CSV file not found: $CSV_FILE"
    echo "❌ CSV introuvable : $CSV_FILE"
    exit 1
fi

# -----------------------------------------------------------------------------
# Skip header and process each line / Ignorer l’en-tête et traiter chaque ligne
# -----------------------------------------------------------------------------
tail -n +2 "$CSV_FILE" | while IFS=',' read -r NOM PRENOM NAISSANCE GROUPE POSTE PROJETS
do
    # Trim whitespace from fields / Nettoyage des espaces
    NOM=$(echo "$NOM" | xargs)
    PRENOM=$(echo "$PRENOM" | xargs)
    NAISSANCE=$(echo "$NAISSANCE" | xargs)
    GROUPE=$(echo "$GROUPE" | xargs)
    PROJETS=$(echo "$PROJETS" | xargs)

    # Call user creation script with 5 parameters / Appel au script de création utilisateur
    sudo bash createUserGroup.sh "$NOM" "$PRENOM" "$NAISSANCE" "$GROUPE" "$PROJETS"
done

echo "✔ CSV processing completed."
echo "✔ Traitement du CSV terminé."
