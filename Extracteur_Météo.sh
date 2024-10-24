#!/bin/bash

# Vérifier si un argument de ville est passé 
if [ -z "$1" ]; then
    VILLE="Toulouse"
else
    VILLE="$1"
fi


FICHIER_METEO="meteo.txt"
DATE=$(date +"%Y-%m-%d - %H:%M")

# Définir le fichier d'historique basé sur la date actuelle
FICHIER_HISTORIQUE="meteo_$(date +"%Y%m%d").txt"

# Utiliser curl pour récupérer les données méteo
# Récupération des données brutes  depuis wttr.in

METEO=$(curl -s "wttr.in/$VILLE?format=%C+%t+%f") # %C pour météo et %t pour température


# Vérifier si la ville existe dans wttr.in
if [[ "$METEO" == *"Unknown location"* ]]; then
    echo "Erreur : La ville '$VILLE' est inconnue. Veuillez entrer une ville."
    exit 1
fi

# Extraire les informations de température actuelle et prévision pour le lendemain
TEMP_ACTUELLE=$(echo "$METEO" | awk '{print $2}')
PREVISION_LENDEMAIN=$(echo "$METEO" | awk '{print $3}')


# Vérifier que les données sont correctes
if [ -z "$TEMP_ACTUELLE" ] || [ -z "$PREVISION_LENDEMAIN" ]; then
    echo "Erreur : Impossible de récupérer la prévision météo pour '$VILLE'."
    exit 1
fi


# Enregistrer  les informations dans le fichier meteo.txt
echo "$DATE - $VILLE : $TEMP_ACTUELLE - $PREVISION_LENDEMAIN" >> $FICHIER_METEO

# Enregistrer les informations dans le fichier historique
echo "$DATE - $VILLE : $TEMP_ACTUELLE - $PREVISION_LENDEMAIN" >> $FICHIER_HISTORIQUE

# Affichage d'un message de confirmation 
echo "Données météo pour $VILLE enregistrées dans $FICHIER_METEO et $FICHIER_HISTORIQUE."
