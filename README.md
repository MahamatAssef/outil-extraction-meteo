# Projet outil
# L'objectif du projet
L'objectif de ce projet est de créer un script Shell qui extrait périodiquement la température actuelle d'une ville 
donnée ainsi que les prévisions météorologiques pour le lendemain en utilisant le service wttr.in le script enregistre-
ra les informations extraites dans un fichier texte , chaque enregistrement devant apparaitre sur une seule ligne .
# Comment exécuter le script

## Historiques des modifications pour v1 
### Version 1.0 
- Création du script de base 'Extracteur_Météo.sh' .
- Récupération des données météo avec 'curl' .
- Extraction et formatage des données .
- En fin , enregistrement des données dans 'meteo.txt' .
### Version 1.1 
- Ajout de la gestion des erreurs pour la récupération des données .
- Amélioration du format d'affichage des informations dans 'meteo.txt' .
 
- pour récuperer la météo d'une ville spécifique :
```bash
./Extracteur_Météo.sh [ville]
```

par exemple :
```bash
./Extracteur_Météo.sh Toulouse 

# Comment configurer cron
- Ouvrir le crontab avec la commande :
```bash
crontab -e 
```
- Ajouter une ligne pour exécuter le script toutes les heures :
```bash
0**** /chemin/vers/mon/script/Extracteur_Météo.sh

###Version 1.3

- Ajout d'une fonctionnalité pour archiver les données météo collectées dans un fichier différent chaque jour (ex : meteo_YYYYMMDD.txt).
- Chaque exécution du script ajoute les nouvelles informations au fichier correspondant à la date du jour.
- Structure des fichiers :
    meteo.txt : Contient les données météo actuelles et les prévisions.
    meteo_YYYYMMDD.txt : Archive quotidienne des données météo pour un historique.
 
