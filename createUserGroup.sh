#!/bin/bash

# -----------------------------------------------------------------------------
# Script: newUser.sh / createUser.sh
# Description (EN): Create a new user with SKEL template, assign main group 
#                  and optional projects.
# Description (FR): Crée un utilisateur avec le modèle SKEL, attribue le groupe 
#                  principal et les projets optionnels.
# Parameters / Paramètres:
#   1 = Last name / Nom
#   2 = First name / Prénom
#   3 = Birth date (YYYY/MM/DD) / Date de naissance (AAAA/MM/JJ)
#   4 = Main user group / Groupe utilisateur principal
#   5 = Projects (semicolon-separated) / Projets (séparés par ;)
# -----------------------------------------------------------------------------

NOM="$1"
PRENOM="$2"
NAISSANCE="$3"
GROUPE="$4"
GROUPE="${GROUPE%%:*}"
PROJETS="$5"

# -----------------------------------------------------------------------------
# 0. Generate username (max 8 chars, handle duplicates)
# 0. Génération du username (max 8 caractères, gestion des doublons)
# -----------------------------------------------------------------------------

# 1 letter of first name / 1ère lettre du prénom
FIRST=$(echo "${PRENOM:0:1}" | tr '[:upper:]' '[:lower:]')

# Up to first 7 letters of last name / Jusqu’aux 7 premières lettres du nom
LAST=$(echo "$NOM" | tr '[:upper:]' '[:lower:]')
LAST7="${LAST:0:7}"

# Base username / Base du username
BASE="${FIRST}${LAST7}"

# Check for duplicates / Vérification des doublons
USERNAME="$BASE"
COUNTER=1

while id "$USERNAME" >/dev/null 2>&1; do
    # Keep 6 chars + 2-digit counter / On garde 6 chars + compteur 2 chiffres
    BASE_SHORT="${BASE:0:6}"
    SUFFIX=$(printf "%02d" "$COUNTER")
    USERNAME="${BASE_SHORT}${SUFFIX}"

    COUNTER=$((COUNTER + 1))

    # Safety check / Sécurité : éviter boucle infinie
    if [[ "$COUNTER" -gt 99 ]]; then
        echo "❌ Too many duplicates for username: $BASE"
        echo "❌ Trop de doublons pour le username : $BASE"
        exit 1
    fi
done

echo "➡ Generated username: $USERNAME"
echo "➡ Username généré : $USERNAME"

# -----------------------------------------------------------------------------
# 1. Generate password from birth date / Construire le mot de passe depuis date
# -----------------------------------------------------------------------------
ANNEE=$(echo "$NAISSANCE" | cut -d'/' -f1)
MOIS=$(echo "$NAISSANCE" | cut -d'/' -f2)
JOUR=$(echo "$NAISSANCE" | cut -d'/' -f3)

PASSWORD="${JOUR}${MOIS}${ANNEE}"

# -----------------------------------------------------------------------------
# 2. Create user with SKEL / Création de l'utilisateur avec SKEL
# -----------------------------------------------------------------------------
if ! id "$USERNAME" >/dev/null 2>&1; then
    useradd -m -k /etc/skel_tekitizy -s /bin/bash "$USERNAME"

    # Set password / Définir le mot de passe
    echo "$USERNAME:$PASSWORD" | chpasswd
    # Force user to change password at first connexion / Force l'utilisateur a changer son mot de passe à la premiére connexion
    chage -d 0 "$USERNAME"
    
    echo "✔ User $USERNAME created with password $PASSWORD"
    echo "✔ Utilisateur $USERNAME créé avec mot de passe $PASSWORD"
else
    echo "ℹ User $USERNAME already exists"
    echo "ℹ Utilisateur $USERNAME déjà existant"
fi

# -----------------------------------------------------------------------------
# 3. Main group management / Gestion du groupe principal
# -----------------------------------------------------------------------------
if ! getent group "$GROUPE" >/dev/null; then
    groupadd "$GROUPE"
    sudo bash groupPerm.sh $GROUPE
fi

usermod -g "$GROUPE" "$USERNAME"
echo "✔ Main group assigned: $GROUPE"
echo "✔ Groupe principal attribué : $GROUPE"

# -----------------------------------------------------------------------------
# 4. Assign projects / Attribution des projets
# -----------------------------------------------------------------------------
if [[ -n "$PROJETS" ]]; then
    IFS=';' read -ra P_LIST <<< "$PROJETS"

    for P in "${P_LIST[@]}"; do
        if [[ -n "$P" ]]; then
            echo "➡ Assigning project: $P to $USERNAME"
            echo "➡ Attribution projet : $P à $USERNAME"
            sudo bash setPermissions.sh "$USERNAME" "$P"
        fi
    done
else
    echo "ℹ No projects assigned"
    echo "ℹ Aucun projet attribué"
fi

echo "✔ newUser.sh process completed for $USERNAME"
echo "✔ createUserGroup terminé pour $USERNAME"
