#!/bin/bash

# Vérifier si un argument de ville est passé
if [ -z "$1" ]; then
    echo "Erreur : veuillez fournir une ville en argument."
    exit 1
fi

VILLE="$1"
FICHIER_METEO="meteo.txt"
DATE=$(date +"%Y-%m-%d-%H:%M")

# Utiliser curl pour récupérer les données météo
METEO=$(curl -s "wttr.in/$VILLE?format=%t+%f+%w+%h+%v")

# Vérifier si la ville existe dans wttr.in
if echo "$METEO" | grep -q "Unknown location"; then
    echo "Erreur : La ville '$VILLE' est inconnue. Veuillez entrer une autre ville."
    exit 1
fi

# Extraire les informations sans unités
TEMP_ACTUELLE=$(echo "$METEO" | awk '{print $1}' | sed 's/+//g' | sed 's/°C//g')
PREVISION_LENDEMAIN=$(echo "$METEO" | awk '{print $2}' | sed 's/+//g' | sed 's/°C//g')
VITESSE_VENT=$(echo "$METEO" | awk '{print $3}' | sed 's/[^0-9]//g')
HUMIDITE=$(echo "$METEO" | awk '{print $4}' | sed 's/%//g')
VISIBILITE=$(echo "$METEO" | awk '{print $5}')

# Gérer la visibilité si elle est vide
if [ -z "$VISIBILITE" ]; then
    VISIBILITE="Non disponible"
fi

# Vérifier que les données sont correctes
if [ -z "$TEMP_ACTUELLE" ] || [ -z "$PREVISION_LENDEMAIN" ] || [ -z "$VITESSE_VENT" ] || [ -z "$HUMIDITE" ]; then
    echo "Erreur : Impossible de récupérer la prévision météo pour '$VILLE'."
    exit 1
fi

# Enregistrer les informations dans le fichier meteo.txt
echo "$DATE - $VILLE : Température actuelle: $TEMP_ACTUELLE°C, Prévision demain: $PREVISION_LENDEMAIN°C, Vitesse du vent: $VITESSE_VENT km/h, Humidité: $HUMIDITE%, Visibilité: $VISIBILITE" >> $FICHIER_METEO

# Affichage d'un message de confirmation
echo "Données météo pour $VILLE enregistrées dans meteo.txt. Allez-y dans le fichier pour les voir."

