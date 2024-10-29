#!/bin/bash

# Vérifier si un argument de ville est passé 
if [ -z "$1" ]; then
    echo "Erreur : veuillez fournir une ville en argument ."
    exit 1
fi

VILLE="$1"
FICHIER_METEO="meteo.txt"
DATE=$(date +"%Y-%m-%d-%H:%M")
# Utiliser curl pour récupérer les données méteo
# Récupération des données brutes  depuis wttr.in

METEO=$(curl -s "wttr.in/$VILLE?format=%t+%f") 

# Vérifier si la ville existe dans wttr.in
if echo "$METEO" | grep -q "Unknown location" ;then
   echo "Erreur : La ville '$VILLE' est inconnue. Veuillez entrer une autre  ville."
   exit 1
fi

# Extraire les informations de température actuelle et prévision pour le lendemain
TEMP_ACTUELLE=$(echo "$METEO" | awk '{print $1}' | sed 's/+//g')
PREVISION_LENDEMAIN=$(echo "$METEO" | awk '{print $2}' | sed 's/+//g')


# Vérifier que les données sont correctes
if [ -z "$TEMP_ACTUELLE" ] || [ -z "$PREVISION_LENDEMAIN" ]; then
    echo "Erreur : Impossible de récupérer la prévision météo pour '$VILLE'."
    exit 1
fi

# Enregistrer  les informations dans le fichier meteo.txt
echo "$DATE - $VILLE : $TEMP_ACTUELLE - $PREVISION_LENDEMAIN" >> $FICHIER_METEO

# Affichage d'un message de confirmation 
echo "Données météo pour $VILLE enregistrées dans meteo.txt. allez-y dans le fichier pour les voir ."
