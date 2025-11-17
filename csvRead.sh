#!/bin/bash

if [$# -ne 1 ];
then
	echo "Usage : $0 fichier.csv"
	exit 1
fi

fichier="$1"

while IFS=',' read -r prenom nom birthDay service reste;
do
	[ -z "$prenom" ] && continue
	[ "$prenom" = "Prénom" ] && continue

	groupe="${service%%:*}"

	echo "Prenom : $prenom"
	echo "nom : $nom"
	echo "birthDay : $birthDay"
	echo "groupe : $groupe"
	echo "------------------"
	bash createUserGroup.sh $prenom $nom $birthDay $groupe
done < "$fichier"

