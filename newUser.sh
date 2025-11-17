#!/bin/bash

echo "Creation of the new user (press ctrl+c to cancel)"

# Firstname
read -p "What is the firstname of the new user ? " firstName
while [[ -z "$firstName" ]]; do
    echo "Firstname cannot be empty."
    read -p "What is the firstname of the new user ? " firstName
done

# Name
read -p "What is the name of the new user ? " name
while [[ -z "$name" ]]; do
    echo "Name cannot be empty."
    read -p "What is the name of the new user ? " name
done

# Birthdate with while-loop until format is valid
read -p "What is the birth date of the new user ? (DD/MM/YYYY) " birthDate

# Loop as long as the date does not conform the format
while [[ ! "$birthDate" =~ ^([0-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/[0-9]{4}$ ]]; do
    echo "Wrong date format! Expected: DD/MM/YYYY"
    read -p "What is the birth date of the new user ? (DD/MM/YYYY) " birthDate
done

# Service
read -p "What is the service of this user ? " service
while [[ -z "$service" ]]; do
    echo "Service cannot be empty."
    read -p "What is the service of this user ? " service
done

# Projects
read -p "What is/are the project(s) of this user ? (separated by ;) " project
while [[ -z "$project" ]]; do
    echo "Project(s) cannot be empty."
    read -p "What is/are the project(s) of this user ? (separated by ;) " project
done

echo ""
echo "You entered:"
echo "  Firstname : $firstName"
echo "  Name      : $name"
echo "  Birthdate : $birthDate"
echo "  Service   : $service"
echo "  Projects  : $project"
echo ""

read -p "Are you sure about the information above? (y/n) " confirm

case "$confirm" in
    y|Y|yes|YES)
        echo "The user is being created..." ;;

    n|N|no|NO)
        echo "Cancelled by user."
        exit 1 ;;

    *)  echo "Invalid response. Please answer yes or no."
        exit 1 ;;
esac

echo "The user is being created..."

bash ./creatUserGroup.sh "$firstName" "$name" "$birthDate" "$service" "$project"

echo "User creation process finished."
