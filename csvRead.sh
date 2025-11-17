#!/bin/bash

CSV_FILE="tekitizy_users.csv"

if [[ ! -f "$CSV_FILE" ]]; then
    echo "❌ CSV introuvable : $CSV_FILE"
    exit 1
fi

# On saute l’en-tête
tail -n +2 "$CSV_FILE" | while IFS=',' read -r NOM PRENOM NAISSANCE GROUPE PROJETS
do
    # Nettoyage espaces
    NOM=$(echo "$NOM" | xargs)
    PRENOM=$(echo "$PRENOM" | xargs)
    NAISSANCE=$(echo "$NAISSANCE" | xargs)
    GROUPE=$(echo "$GROUPE" | xargs)
    PROJETS=$(echo "$PROJETS" | xargs)

    # Appel au script de création utilisateur (5 paramètres)
    ./createUserGroup.sh "$NOM" "$PRENOM" "$NAISSANCE" "$GROUPE" "$PROJETS"
done
