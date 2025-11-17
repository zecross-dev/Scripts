#!/bin/bash

# -----------------------------------------------------------------------------
# Script: createFullStructure.sh
# Description (EN): Create the full directory structure for services and projects.
# Description (FR): Crée l'arborescence complète des services et des projets.
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Variables: Base directories for services and projects / Répertoires de base pour les services et projets
# -----------------------------------------------------------------------------
BASE_SERVICES=~/SERVICES
BASE_PROJETS=~/PROJETS

# -----------------------------------------------------------------------------
# Variables: Definition of services and sub-services / Définition des services et sous-services
# -----------------------------------------------------------------------------
declare -A SERVICES=(
    [DIRECTION]="Stratégie PMO Gouvernance"
    [RESSOURCES_HUMAINES]="Recrutement Paie Formation"
    [COMMERCIAL_FINANCE]="Ventes Avant-vente Customer_Success Comptabilité"
    [INGENIERIE]="Développement_Backend Développement_Frontend DevOps Support Qualité IA Prototypage"
    [OPERATIONS]="Atelier Maintenance Logistique Support"
)

# -----------------------------------------------------------------------------
# Variables: Definition of projects / Définition des projets
# -----------------------------------------------------------------------------
PROJETS=("PROJET_APOLLO" "PROJET_NOVA" "PROJET_LUMEN" "PROJET_VORTEX" "PROJET_ORION")

# -----------------------------------------------------------------------------
# Section: Create main directories / Création des dossiers principaux
# -----------------------------------------------------------------------------
mkdir -p "$BASE_SERVICES"
mkdir -p "$BASE_PROJETS"

# -----------------------------------------------------------------------------
# Section: Create services and sub-services / Création des services et sous-services
# -----------------------------------------------------------------------------
for service in "${!SERVICES[@]}"; do
    service_path="$BASE_SERVICES/$service"
    mkdir -p "$service_path"
    
    for subService in ${SERVICES[$service]}; do
        mkdir -p "$service_path/$subService"
    done
done

# -----------------------------------------------------------------------------
# Section: Create projects / Création des projets
# -----------------------------------------------------------------------------
for projet in "${PROJETS[@]}"; do
    mkdir -p "$BASE_PROJETS/$projet"
done

# -----------------------------------------------------------------------------
# Section: Completion message / Message de confirmation
# -----------------------------------------------------------------------------
echo "✅ Arborescence complète des services et projets créée avec succès ! / Full services and projects structure successfully created!"
