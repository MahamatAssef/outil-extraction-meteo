# Projet outil
# L'objectif du projet
L'objectif de ce projet est de créer un script Shell qui extrait périodiquement la température actuelle d'une ville 
donnée ainsi que les prévisions météorologiques pour le lendemain en utilisant le service wttr.in le script enregistre-
ra les informations extraites dans un fichier texte , chaque enregistrement devant apparaitre sur une seule ligne .
# Comment exécuter le script
- pour récuperer la météo d'une ville spécifique :
```bash
./Extracteur_Météo.sh [ville]
```
par exemple :
```bash
./Extracteur_Météo.sh Toulouse 
```
## Historiques des modifications pour v1 
### Version 1.0 
- Création du script de base 'Extracteur_Météo.sh' .
- Récupération des données météo avec 'curl' .
- Extraction et formatage des données .
- En fin , enregistrement des données dans 'meteo.txt' .
### Version 1.1 
- Ajout de la gestion des erreurs pour la récupération des données .
- Amélioration du format d'affichage des informations dans 'meteo.txt' .

## Historiques des modifications pour v2
### Version 2
- Definir une ville par defaut. J'ai mis la ville de Toulouse comme ville par défaut.
- J'ai recupere les données météo actuelles : J'ai utilise curl pour obtenir la condition meteo et a la temperature de la ville et stocke ces donnees dans une variable data.
- J'extrais et je verifie les informations : j'ai utilise awk pour isoler la temperature actuelle et la condition météo
- J'ai enregistrer les informations : j'ai ajoute la date , l'heure , la ville , la température et la prévision du lendemain dans le fichier meteo.txt , puis j'affiche le contenu pour confirmer l'enregistrement.
### Comment configurer cron
- Ouvrir le crontab avec la commande :
crontab -e 
- Ajouter une ligne pour exécuter le script toutes les heures :

## Historiques des modifications pour v3
- Ajout d'une variable fichier_historique pour créer un fichier spécifique à la date du jour, utilisant le format meteo_YYYYMMDD.txt.
- Enregistrement des données météo dans ce fichier quotidien, en ajoutant chaque nouvelle entrée à la suite des précédentes.
- Maintien du format d'enregistrement consistent pour les données : date, heure, ville, condition météo, température actuelle, et prévision.
- Utilisation de date '+%Y%m%d' pour s'assurer que le nom du fichier est correct et correspond à la date actuelle.
- Confirmation visuelle de l'enregistrement dans le fichier d'historique à l'aide d'un message d'affichage.