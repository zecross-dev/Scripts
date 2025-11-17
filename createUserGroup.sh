#!/bin/bash

if [ $# -ne 4 ];
then
        echo "Need 4 args to create new user"
        exit 1
fi

ftname=$1
name=$2
birthDay=$3   # format conseillé : AAAAMMJJ
Group=$4

ftLetter="${ftname:0:1}"

# Limitation à 8 caractères max : 1 lettre + max 7 lettres du nom
if [[ ${#name} -gt 7 ]]; then
        baseUserName="$ftLetter${name:0:7}"
else
        baseUserName="$ftLetter$name"
fi

userName="$baseUserName"

# Vérifier si le login existe, si oui ajouter un suffixe numérique
i=1
while grep -q "^$userName:" /etc/passwd ; do
        echo "Le login '$userName' existe déjà. Tentative avec suffixe $i"
        # Tronquer si dépasse 8 caractères avec le suffixe
        maxLen=$((8 - ${#i}))
        userName="${baseUserName:0:$maxLen}$i"
        ((i++))
done

echo "Login final choisi : $userName"

# Vérifier si le groupe existe, sinon le créer
if getent group "$Group" > /dev/null; then
        echo "Le groupe '$Group' existe déjà."
else
        echo "Le groupe '$Group' n'existe pas encore. Création..."
        groupadd "$Group"
        if [ $? -ne 0 ]; then
                echo "Erreur : impossible de créer le groupe."
                exit 1
        fi
fi

# Création de l'utilisateur avec mot de passe = date de naissance
echo "Création de l'utilisateur $userName ..."
useradd -m -g "$Group" "$userName"

# Définir le mot de passe
echo "$userName:$birthDay" | chpasswd

echo "Utilisateur $userName créé avec succès."
echo "Mot de passe initial : $birthDay"
echo "Ajouté au groupe : $Group"
