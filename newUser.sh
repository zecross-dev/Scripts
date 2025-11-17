#!/bin/bash

# -----------------------------------------------------------------------------
# Script: interactiveCreateUser.sh
# Description (EN): Interactive script to create a new user with details like name, birthdate, service, and projects.
# Description (FR): Script interactif pour créer un nouvel utilisateur avec nom, prénom, date de naissance, service et projets.
# -----------------------------------------------------------------------------

echo "Creating a new user (press Ctrl+C to cancel) / Création d'un nouvel utilisateur (Ctrl+C pour annuler)"

# ----------------------------
# Firstname / Prénom
# ----------------------------
read -p "Enter the firstname of the new user / Entrez le prénom du nouvel utilisateur: " firstName
while [[ -z "$firstName" ]]; do
    echo "Firstname cannot be empty / Le prénom ne peut pas être vide."
    read -p "Enter the firstname of the new user / Entrez le prénom du nouvel utilisateur: " firstName
done

# ----------------------------
# Name / Nom
# ----------------------------
read -p "Enter the name of the new user / Entrez le nom du nouvel utilisateur: " name
while [[ -z "$name" ]]; do
    echo "Name cannot be empty / Le nom ne peut pas être vide."
    read -p "Enter the name of the new user / Entrez le nom du nouvel utilisateur: " name
done

# ----------------------------
# Birthdate / Date de naissance
# Format: DD/MM/YYYY
# ----------------------------
read -p "Enter the birth date (DD/MM/YYYY) / Entrez la date de naissance (JJ/MM/AAAA): " birthDate
while [[ ! "$birthDate" =~ ^([0-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/[0-9]{4}$ ]]; do
    echo "Wrong date format! Expected: DD/MM/YYYY / Format incorrect ! Attendu : JJ/MM/AAAA"
    read -p "Enter the birth date (DD/MM/YYYY) / Entrez la date de naissance (JJ/MM/AAAA): " birthDate
done

# ----------------------------
# Service / Service
# ----------------------------
read -p "Enter the service of this user / Entrez le service de l'utilisateur: " service
while [[ -z "$service" ]]; do
    echo "Service cannot be empty / Le service ne peut pas être vide."
    read -p "Enter the service of this user / Entrez le service de l'utilisateur: " service
done

# ----------------------------
# Projects / Projets
# ----------------------------
read -p "Enter the project(s) (separated by ;) / Entrez le(s) projet(s) (séparés par ;) : " project
while [[ -z "$project" ]]; do
    echo "Project(s) cannot be empty / Les projet(s) ne peuvent pas être vide(s)."
    read -p "Enter the project(s) (separated by ;) / Entrez le(s) projet(s) (séparés par ;) : " project
done

# ----------------------------
# Confirmation / Confirmation
# ----------------------------
echo ""
echo "You entered / Vous avez saisi :"
echo "  Firstname / Prénom : $firstName"
echo "  Name / Nom         : $name"
echo "  Birthdate / Date   : $birthDate"
echo "  Service / Service  : $service"
echo "  Projects / Projets : $project"
echo ""

read -p "Are you sure about this information? (y/n) / Confirmez-vous ces informations ? (y/n) : " confirm
case "$confirm" in
    y|Y|yes|YES)
        echo "Creating the user... / Création de l'utilisateur..." ;;
    n|N|no|NO)
        echo "Cancelled by user / Annulé par l'utilisateur."
        exit 1 ;;
    *)
        echo "Invalid response / Réponse invalide. Please answer yes or no / Veuillez répondre par yes ou no."
        exit 1 ;;
esac

# ----------------------------
# Execute user creation / Appel du script de création
# ----------------------------
bash ./createUserGroup.sh "$name" "$firstName" "$birthDate" "$service" "$project"

echo "User creation process finished / Processus de création terminé."
