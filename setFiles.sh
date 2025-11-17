#!/bin/bash

# -----------------------------------------------------------------------------
# Script: createFullStructure.sh
# Description: Crée l'arborescence complète des services et projets
# -----------------------------------------------------------------------------

BASE_SERVICES=~/SERVICES
BASE_PROJETS=~/PROJETS

# Définition des services et sous-services
declare -A SERVICES=(
    [DIRECTION]="Stratégie PMO Gouvernance"
    [RESSOURCES_HUMAINES]="Recrutement Paie Formation"
    [COMMERCIAL_FINANCE]="Ventes Avant-vente Customer_Success Comptabilité"
    [INGENIERIE]="Développement_Backend Développement_Frontend DevOps Support Qualité IA Prototypage"
    [OPERATIONS]="Atelier Maintenance Logistique Support"
)

# Définition des projets
PROJETS=("PROJET_APOLLO" "PROJET_NOVA" "PROJET_LUMEN" "PROJET_VORTEX" "PROJET_ORION")

# Création des dossiers principaux
mkdir -p "$BASE_SERVICES"
mkdir -p "$BASE_PROJETS"

# Création des services et sous-services
for service in "${!SERVICES[@]}"; do
    service_path="$BASE_SERVICES/$service"
    mkdir -p "$service_path"
    for subService in ${SERVICES[$service]}; do
        mkdir -p "$service_path/$subService"
    done
done

# Création des projets
for projet in "${PROJETS[@]}"; do
    mkdir -p "$BASE_PROJETS/$projet"
done

echo "Arborescence complète des services et projets créée avec succès !"
