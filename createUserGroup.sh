#!/bin/bash
# --------------------------------------------------------------
# Paramètres :
# 1 = Nom
# 2 = Prénom
# 3 = Date de naissance (AAAA/MM/JJ)
# 4 = Groupe utilisateur principal
# 5 = Projet(s) (séparés par ;)
# --------------------------------------------------------------

NOM="$1"
PRENOM="$2"
NAISSANCE="$3"
GROUPE="$4"
PROJETS="$5"

# --------------------------------------------------------------
# 0. Génération du username (max 8 caractères, gestion doublons)
# --------------------------------------------------------------

# 1 lettre du prénom
FIRST=$(echo "${PRENOM:0:1}" | tr '[:upper:]' '[:lower:]')

# 7 premières lettres du nom (ou moins)
LAST=$(echo "$NOM" | tr '[:upper:]' '[:lower:]')
LAST7=$(echo "${LAST:0:7}")

# Base du username
BASE="${FIRST}${LAST7}"

# Vérification doublons
USERNAME="$BASE"
COUNTER=1

# Tant que l'utilisateur existe, on construit pxxx01, pxxx02...
while id "$USERNAME" >/dev/null 2>&1; do
    # Retire les 2 dernières lettres et remplace par 2 chiffres
    BASE_SHORT=$(echo "${BASE:0:6}")  # on garde 6 chars, puis compteur 2 chars

    # Format 01, 02, ..., 99
    SUFFIX=$(printf "%02d" "$COUNTER")
    USERNAME="${BASE_SHORT}${SUFFIX}"

    COUNTER=$((COUNTER + 1))

    # Sécurité : ne jamais boucler à l’infini
    if [[ "$COUNTER" -gt 99 ]]; then
        echo "❌ Trop de doublons pour le username : $BASE"
        exit 1
    fi
done

echo "➡ Username généré : $USERNAME"

# --------------------------------------------------------------
# 1. Construire le mot de passe basé sur date naissance
# --------------------------------------------------------------
ANNEE=$(echo "$NAISSANCE" | cut -d'/' -f1)
MOIS=$(echo "$NAISSANCE" | cut -d'/' -f2)
JOUR=$(echo "$NAISSANCE" | cut -d'/' -f3)

PASSWORD="${JOUR}${MOIS}${ANNEE}"

# --------------------------------------------------------------
# 2. Créer utilisateur avec SKEL existant
# --------------------------------------------------------------
if ! id "$USERNAME" >/dev/null 2>&1; then
    useradd -m -k /etc/skel_tekitizy -s /bin/bash "$USERNAME"

    # chpasswd définit le mot de passe une fois l'utilisateur créé.
    # C'est useradd qui crée l'utilisateur, chpasswd ne fait que poser le mot de passe.
    echo "$USERNAME:$PASSWORD" | chpasswd

    echo "✔ Utilisateur $USERNAME créé avec mot de passe $PASSWORD"
else
    echo "ℹ Utilisateur $USERNAME déjà existant."
fi

# --------------------------------------------------------------
# 3. Gestion groupe principal
# --------------------------------------------------------------
if ! getent group "$GROUPE" >/dev/null; then
    groupadd "$GROUPE"
fi

usermod -g "$GROUPE" "$USERNAME"

echo "✔ Groupe principal attribué : $GROUPE"

# --------------------------------------------------------------
# 4. Gestion des projets
# --------------------------------------------------------------
if [[ -n "$PROJETS" ]]; then
    IFS=';' read -ra P_LIST <<< "$PROJETS"

    for P in "${P_LIST[@]}"; do
        if [[ -n "$P" ]]; then
            echo "➡ Attribution projet : $P à $USERNAME"
            ./set_permissions.sh "$USERNAME" "$P"
        fi
    done
else
    echo "ℹ Aucun projet attribué."
fi

echo "✔ createUserGroup terminé pour $USERNAME"
